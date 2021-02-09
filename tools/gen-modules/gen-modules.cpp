// Vita3K emulator project
// Copyright (C) 2018 Vita3K team
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program; if not, write to the Free Software Foundation, Inc.,
// 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

#include <yaml-cpp/yaml.h>

#ifdef WIN32
#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#else
#include <sys/stat.h>
#endif

#include <algorithm>
#include <fstream>
#include <iostream>

using namespace YAML;

static const std::string indent("    ");

static const std::string &sql_output_path("data/internal/");
static const std::string &sql_modules(sql_output_path + "nids_modules.sql");
static const std::string &sql_libraries(sql_output_path + "nids_libraries.sql");
static const std::string &sql_functions(sql_output_path + "nids_functions.sql");

static const std::string &module_out_path("vita3k/modules/");
static const std::string &cmake_module_out_path(module_out_path + "CMakeLists.txt");

static void gen_license_comment(std::ostream &dst) {
    dst << "// Vita3K emulator project" << std::endl;
    dst << "// Copyright (C) 2018 Vita3K team" << std::endl;
    dst << "//" << std::endl;
    dst << "// This program is free software; you can redistribute it and/or modify" << std::endl;
    dst << "// it under the terms of the GNU General Public License as published by" << std::endl;
    dst << "// the Free Software Foundation; either version 2 of the License, or" << std::endl;
    dst << "// (at your option) any later version." << std::endl;
    dst << "//" << std::endl;
    dst << "// This program is distributed in the hope that it will be useful," << std::endl;
    dst << "// but WITHOUT ANY WARRANTY; without even the implied warranty of" << std::endl;
    dst << "// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the" << std::endl;
    dst << "// GNU General Public License for more details." << std::endl;
    dst << "//" << std::endl;
    dst << "// You should have received a copy of the GNU General Public License along" << std::endl;
    dst << "// with this program; if not, write to the Free Software Foundation, Inc.," << std::endl;
    dst << "// 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA." << std::endl;
    dst << std::endl;
}

static void gen_modules_cmakelists_line(const std::string &module, const std::vector<std::string> &libraries) {
    std::ofstream out(cmake_module_out_path, std::ios::app);

    for (const auto &library : libraries) {
        out << "\n\t" << module << "/" << library << ".cpp";
        out << " " << module << "/" << library << ".h";
    }
}

static void gen_library_cpp(std::ostream &dst, const std::string &library, const std::vector<std::string> &functions) {
    gen_license_comment(dst);
    dst << "#include \"" << library << ".h\"" << std::endl;

    for (const auto& lib_func : functions) {
        dst << std::endl;
        dst << "EXPORT(int, " << lib_func << ") {" << std::endl;
        dst << indent << "return UNIMPLEMENTED();" << std::endl;
        dst << "}" << std::endl;
    }

    dst << std::endl;
    for (const auto &function : functions) {
        dst << "BRIDGE_IMPL(" << function << ")" << std::endl;
    }
}

static void gen_library_h(std::ostream &dst, const std::string &library, const std::vector<std::string> &functions) {
    gen_license_comment(dst);
    dst << "#pragma once" << std::endl;
    dst << std::endl;
    dst << "#include <module/module.h>" << std::endl;
    dst << std::endl;

    for (const auto &lib_func : functions) {
        dst << "BRIDGE_DECL(" << lib_func << ")" << std::endl;
    }
}

static void gen_library_stub(const std::string &module, const std::string &library, const std::vector<std::string> &functions) {
    const auto module_path = module_out_path + module;

#ifdef WIN32
        CreateDirectoryA(module_path.c_str(), nullptr);
#else
        const int mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
        mkdir(module_path.c_str(), mode);
#endif

    const std::string library_cpp_path = module_path + "/" + library + ".cpp";
    const std::string library_h_path = module_path + "/" + library + ".h";
    std::ofstream library_cpp(library_cpp_path.c_str());
    gen_library_cpp(library_cpp, library, functions);
    std::ofstream library_h(library_h_path.c_str());
    gen_library_h(library_h, library, functions);
}

static void gen_sql_script_line(const int nid, const std::string &module_name, const std::string &library_name, const std::string &function_name) {
    std::ofstream output(sql_functions, std::ios::app);
    output << "(" + std::to_string(nid) + ",'" + module_name + "','" + library_name + "','" + function_name + "')," << std::endl;
}

static void gen_sql_script_line(const int nid, const std::string &module_name, const std::string &library_name, const bool is_kernel) {
    std::ofstream output(sql_libraries, std::ios::app);
    output << "(" + std::to_string(nid) + ",'" + module_name + "','" + library_name + "'," + std::to_string(is_kernel) + ")," << std::endl;
}

static void gen_sql_script_line(const int nid, const std::string &module_name) {
    std::ofstream output(sql_modules, std::ios::app);
    output << "(" + std::to_string(nid) + ",'" + module_name << "')," << std::endl;
}

static void gen_sql_comment(const std::string &out_string, const bool for_library = false) {
    if (for_library) {
        std::stringstream out("-- Module \"" + out_string + "\"");
        std::ofstream out_library(sql_libraries, std::ios::app);
        out_library << out.str() << std::endl;

        std::ofstream out_functions(sql_functions, std::ios::app);
        out_functions << out.str() << std::endl;
        return;
    }

    std::ofstream out_file(sql_functions, std::ios::app);
    out_file << "-- Library \"" + out_string + "\"" << std::endl;
}

static int get_int(const std::string &input) {
    return static_cast<int>(std::stoul(input, nullptr, 16));
}

static void parse_db(const Node &db) {
    for (const auto &module : db["modules"]) {
        const auto module_name = module.first.as<std::string>();
        gen_sql_comment(module_name, true);

        const auto module_nid = get_int(module.second["nid"].as<std::string>());
        gen_sql_script_line(module_nid, module_name);

        std::vector<std::string> libraries;

        for (const auto &library : module.second["libraries"]) {
            const auto library_name = library.first.as<std::string>();
            libraries.push_back(library_name);

            const auto library_nid = get_int(library.second["nid"].as<std::string>());
            const auto kernel = library.second["kernel"].as<bool>();
            gen_sql_script_line(library_nid, module_name, library_name, kernel);

            if (kernel) {
                continue;
            }

            gen_sql_comment(library_name);

            std::vector<std::string> function_names;
            for (const auto &function : library.second["functions"]) {
                const auto function_name = function.first.as<std::string>();
                function_names.push_back(function_name);

                const auto function_nid = get_int(function.second.as<std::string>());
                gen_sql_script_line(function_nid, module_name, library_name, function_name);
            }

            gen_library_stub(module_name, library_name, function_names);
        }

        gen_modules_cmakelists_line(module_name, libraries);
    }
}

static void gen_footers() {
    std::ofstream out_modules(sql_modules, std::ios::app);
    out_modules << "(NULL,NULL);" << std::endl;

    std::ofstream out_libraries(sql_libraries, std::ios::app);
    out_libraries << "(NULL,NULL,NULL,NULL);" << std::endl;

    std::ofstream out_functions(sql_functions, std::ios::app);
    out_functions << "(NULL,NULL,NULL,NULL);" << std::endl;

    std::ofstream out_cmake(cmake_module_out_path, std::ios::app);
    out_cmake << "\n)" << std::endl;
    out_cmake << "target_include_directories(modules PUBLIC include)" << std::endl;
    out_cmake << "target_link_libraries(modules PUBLIC module)" << std::endl;
}

static void gen_sql_script_heading() {
#ifdef WIN32
        CreateDirectoryA(sql_output_path.c_str(), nullptr);
#else
        const int mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
        mkdir(sql_output_path.c_str(), mode);
#endif

    std::stringstream out_comment;
    gen_license_comment(out_comment);
    std::string out_edit(out_comment.str());
    std::replace(out_edit.begin(), out_edit.end(), '/', '-');

    std::stringstream out;
    out << indent << "nid INTEGER NULL," << std::endl;
    out << indent << "module_name VARCHAR NULL";

    std::ofstream out_modules(sql_modules, std::ios::out | std::ios::trunc);
    out_modules << out_edit;
    out_modules << "DROP TABLE IF EXISTS module_nids;" << std::endl;
    out_modules << std::endl;
    out_modules << "CREATE TABLE module_nids (" << std::endl;
    out_modules << out.str() << std::endl;
    out_modules << ");" << std::endl;
    out_modules << std::endl;
    out_modules << "INSERT INTO module_nids VALUES" << std::endl;

    out << "," << std::endl << indent << "library_name VARCHAR NULL";

    std::ofstream out_libraries(sql_libraries, std::ios::out | std::ios::trunc);
    out_libraries << out_edit;
    out_libraries << "DROP TABLE IF EXISTS library_nids;" << std::endl;
    out_libraries << std::endl;
    out_libraries << "CREATE TABLE library_nids (" << std::endl;
    out_libraries << out.str();
    out_libraries << "," << std::endl << indent << "is_kernel INTEGER NULL" << std::endl;
    out_libraries << ");" << std::endl;
    out_libraries << std::endl;
    out_libraries << "INSERT INTO library_nids VALUES" << std::endl;

    out << "," << std::endl << indent << "function_name VARCHAR NULL";

    std::ofstream out_functions(sql_functions, std::ios::out | std::ios::trunc);
    out_functions << out_edit;
    out_functions << "DROP TABLE IF EXISTS function_nids;" << std::endl;
    out_functions << std::endl;
    out_functions << "CREATE TABLE function_nids (" << std::endl;
    out_functions << out.str() << std::endl;
    out_functions << ");" << std::endl;
    out_functions << std::endl;
    out_functions << "INSERT INTO function_nids VALUES" << std::endl;
}

static void gen_headings() {
    gen_sql_script_heading();

    std::ofstream out(cmake_module_out_path, std::ios::out | std::ios::trunc);

    out << "add_library(modules STATIC" << std::endl;
    out << "\t" << "module_parent.cpp include/modules/module_parent.h" << std::endl;
}

int main(int argc, const char *argv[]) {
    if (argc != 2) {
        std::cout << "Usage: " << argv[0] << " <path_to_db.yml>" << std::endl;
        return 0;
    }

    try {
        const Node db = LoadFile(argv[1]);
        gen_headings();
        parse_db(db);
        gen_footers();
    }
    catch (Exception &err) {
        std::cout << "Could not load " << argv[1] << ": " << err.what();
    }

    return 0;
}
