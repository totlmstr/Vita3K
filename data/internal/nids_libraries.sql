-- Vita3K emulator project
-- Copyright (C) 2018 Vita3K team
--
-- This program is free software; you can redistribute it and-or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License along
-- with this program; if not, write to the Free Software Foundation, Inc.,
-- 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

DROP TABLE IF EXISTS library_nids;

CREATE TABLE library_nids (
    nid INTEGER NULL,
    module_name VARCHAR NULL,
    library_name VARCHAR NULL,
    is_kernel INTEGER NULL
);

INSERT INTO library_nids VALUES
-- Module "SceAVConfig"
(2044784703,'SceAVConfig','SceAVConfig',0),
-- Module "SceAppMgr"
(-1963887594,'SceAppMgr','SceAppMgr',0),
(-589201160,'SceAppMgr','SceAppMgrForDriver',1),
(-1503634065,'SceAppMgr','SceAppMgrUser',0),
(849364014,'SceAppMgr','SceSharedFb',0),
-- Module "SceAppUtil"
(1222647156,'SceAppUtil','SceAppUtil',0),
(-1660544735,'SceAppUtil','SceAppUtilAddcontForce',0),
(-634934829,'SceAppUtil','SceAppUtilBook',0),
(-378825701,'SceAppUtil','SceAppUtilCache',0),
(1993450761,'SceAppUtil','SceAppUtilExt',0),
-- Module "SceAtrac"
(-1699816800,'SceAtrac','SceAtrac',0),
-- Module "SceAudio"
(1133230423,'SceAudio','SceAudio',0),
-- Module "SceAudioIn"
(-119774813,'SceAudioIn','SceAudioIn',0),
-- Module "SceAudiodec"
(715530310,'SceAudiodec','SceAudiodecUser',0),
-- Module "SceAudioenc"
(-1455902298,'SceAudioenc','SceAudioencUser',0),
-- Module "SceAvPlayer"
(-99561883,'SceAvPlayer','SceAvPlayer',0),
-- Module "SceAvcodec"
(-1587099282,'SceAvcodec','SceAvcodec',0),
(1719948393,'SceAvcodec','SceAvcodecForDriver',1),
-- Module "SceAvcodecUser"
(195718639,'SceAvcodecUser','SceVideoencUser',0),
-- Module "SceBbmc"
(-351595081,'SceBbmc','SceBbmc',0),
-- Module "SceBgAppUtil"
(-112104953,'SceBgAppUtil','SceBgAppUtil',0),
-- Module "SceBt"
(-1752835224,'SceBt','SceBt',0),
(-728979923,'SceBt','SceBtForDriver',1),
-- Module "SceCamera"
(-627985427,'SceCamera','SceCamera',0),
(-1128521910,'SceCamera','SceCameraForDriver',1),
-- Module "SceClipboard"
(1798597288,'SceClipboard','SceClipboard',0),
-- Module "SceClockgen"
(-15334860,'SceClockgen','SceClockgenForDriver',1),
-- Module "SceCodecEngine"
(1184542818,'SceCodecEngine','SceCodecEngineUser',0),
-- Module "SceCodecEnginePerf"
(-1678442579,'SceCodecEnginePerf','SceCodecEnginePerf',0),
-- Module "SceCodecEngineWrapper"
(1553917369,'SceCodecEngineWrapper','SceCodecEngineWrapper',0),
-- Module "SceCommonDialog"
(-449347220,'SceCommonDialog','SceCommonDialog',0),
(-2009268900,'SceCommonDialog','SceNpWebApiCommonDialog',0),
-- Module "SceCompat"
(255168669,'SceCompat','SceCompat',0),
-- Module "SceCoredump"
(-1589401729,'SceCoredump','SceCoredump',0),
(-1554943670,'SceCoredump','SceCoredumpForDriver',1),
(642181592,'SceCoredump','SceCoredumpNounlink',0),
-- Module "SceCtrl"
(-778574905,'SceCtrl','SceCtrl',0),
(2015602129,'SceCtrl','SceCtrlForDriver',1),
-- Module "SceDTrace"
(1768529712,'SceDTrace','SceDTrace',0),
-- Module "SceDeci4p"
(2038315456,'SceDeci4p','SceDeci4pUserp',0),
-- Module "SceDeci4pDbgp"
(-70235084,'SceDeci4pDbgp','SceDeci4pDbgpForDriver',1),
-- Module "SceDisplay"
(1591277972,'SceDisplay','SceDisplay',0),
(-1611839572,'SceDisplay','SceDisplayForDriver',1),
(1336593681,'SceDisplay','SceDisplayUser',0),
-- Module "SceDriverUser"
(-1850741949,'SceDriverUser','SceDrmBridgeUser',0),
(-738119283,'SceDriverUser','SceErrorUser',0),
-- Module "SceError"
(1557318353,'SceError','SceError',0),
-- Module "SceExcpmgr"
(1285619157,'SceExcpmgr','SceExcpmgrForKernel',1),
-- Module "SceFace"
(-177718025,'SceFace','SceFace',0),
-- Module "SceFiber"
(-124933520,'SceFiber','SceFiber',0),
-- Module "SceFios2"
(987026992,'SceFios2','SceFios2',0),
(-1024621865,'SceFios2','SceFios2User',0),
-- Module "SceFios2Kernel"
(-2024294590,'SceFios2Kernel','SceFios2Kernel',0),
(-398573402,'SceFios2Kernel','SceFios2Kernel02',0),
(1423358443,'SceFios2Kernel','SceFios2KernelForDriver',1),
-- Module "SceGameUpdate"
(769238573,'SceGameUpdate','SceGameUpdate',0),
-- Module "SceGps"
(191837182,'SceGps','SceGps',0),
-- Module "SceGpuEs4"
(1417683841,'SceGpuEs4','SceGpuEs4ForDriver',1),
(1858159677,'SceGpuEs4','SceGpuEs4ForUser',0),
-- Module "SceGxm"
(-143956291,'SceGxm','SceGxm',0),
(1072059622,'SceGxm','SceGxmInternal',0),
(-2095801171,'SceGxm','SceGxmInternalForGles',0),
(-1504972985,'SceGxm','SceGxmInternalForReplay',0),
(-913642631,'SceGxm','SceGxmInternalForVsh',0),
-- Module "SceHandwriting"
(715478581,'SceHandwriting','SceHandwriting',0),
-- Module "SceHid"
(-499143326,'SceHid','SceHid',0),
(-1241511535,'SceHid','SceHidForDriver',1),
-- Module "SceHttp"
(-386835234,'SceHttp','SceHttp',0),
-- Module "SceIdStorage"
(-508793476,'SceIdStorage','SceIdStorageForDriver',1),
-- Module "SceIme"
(-766169065,'SceIme','SceIme',0),
-- Module "SceIncomingDialog"
(1348007083,'SceIncomingDialog','SceIncomingDialog',0),
-- Module "SceIofilemgr"
(-218159250,'SceIofilemgr','SceIofilemgr',0),
(1090333127,'SceIofilemgr','SceIofilemgrForDriver',1),
-- Module "SceJpeg"
(-2012481776,'SceJpeg','SceJpegUser',0),
-- Module "SceJpegArm"
(435177107,'SceJpegArm','SceJpegArm',0),
-- Module "SceJpegEnc"
(927514579,'SceJpegEnc','SceJpegEncUser',0),
-- Module "SceJpegEncArm"
(-811850846,'SceJpegEncArm','SceJpegEncArm',0),
-- Module "SceKernelDmacMgr"
(-1444564240,'SceKernelDmacMgr','SceDmacmgr',0),
(-347195592,'SceKernelDmacMgr','SceDmacmgrForDriver',1),
-- Module "SceKernelIntrMgr"
(-1645199295,'SceKernelIntrMgr','SceIntrmgrForDriver',1),
(128736826,'SceKernelIntrMgr','SceIntrmgrForKernel',1),
-- Module "SceKernelModulemgr"
(-1334089153,'SceKernelModulemgr','SceBacktrace',0),
(2009808342,'SceKernelModulemgr','SceBacktraceForDriver',1),
(-353561066,'SceKernelModulemgr','SceModulemgr',0),
(-727315886,'SceKernelModulemgr','SceModulemgrForDriver',1),
(-1002046877,'SceKernelModulemgr','SceModulemgrForKernel',1),
-- Module "SceKernelThreadMgr"
(-2053495631,'SceKernelThreadMgr','SceThreadmgr',0),
(1586302498,'SceKernelThreadMgr','SceThreadmgrCoredumpTime',0),
(-490469852,'SceKernelThreadMgr','SceThreadmgrForDriver',1),
(-1463152899,'SceKernelThreadMgr','SceThreadmgrForKernel',1),
-- Module "SceLcd"
(-91132559,'SceLcd','SceLcdForDriver',1),
-- Module "SceLibDbg"
(1648228742,'SceLibDbg','SceDbg',0),
-- Module "SceLibJson"
(139769500,'SceLibJson','SceLibJson',0),
-- Module "SceLibKernel"
(-890655514,'SceLibKernel','SceLibKernel',0),
(-106136328,'SceLibKernel','SceLibRng',0),
(-1884713231,'SceLibKernel','SceLibSsp',0),
-- Module "SceLibMono"
(1933841243,'SceLibMono','SceLibMono',0),
-- Module "SceLibMonoBridge"
(-731479836,'SceLibMonoBridge','SceLibMonoBridge',0),
-- Module "SceLibMp4Recorder"
(1591762447,'SceLibMp4Recorder','SceLibMp4Recorder',0),
-- Module "SceLibMtp"
(-1524810472,'SceLibMtp','SceLibMtp',0),
-- Module "SceLibXml"
(-1028510055,'SceLibXml','SceLibXml',0),
-- Module "SceLibc"
(-1102857465,'SceLibc','SceLibc',0),
(-844219267,'SceLibc','SceLibm',0),
(-144534976,'SceLibc','SceLibstdcxx',0),
-- Module "SceLiveArea"
(1392757511,'SceLiveArea','SceLiveAreaUtil',0),
-- Module "SceLocation"
(-1840412969,'SceLocation','SceLibLocation',0),
-- Module "SceLocationExtension"
(785136726,'SceLocationExtension','SceLibLocationExtension',0),
-- Module "SceLowio"
(-326535037,'SceLowio','SceDsiForDriver',1),
(-252750013,'SceLowio','SceGpioForDriver',1),
(-515117202,'SceLowio','SceI2cForDriver',1),
(-889389488,'SceLowio','SceIftuForDriver',1),
(-426588377,'SceLowio','ScePervasiveForDriver',1),
-- Module "SceLsdb"
(1807900183,'SceLsdb','SceLsdb',0),
-- Module "SceMotion"
(-598271169,'SceMotion','SceMotion',0),
-- Module "SceMotionDev"
(527854279,'SceMotionDev','SceMotionDev',0),
(-1526644582,'SceMotionDev','SceMotionDevForDriver',1),
-- Module "SceMsif"
(-1224341430,'SceMsif','SceMsifForDriver',1),
-- Module "SceMtpIfDriver"
(1593459000,'SceMtpIfDriver','SceMtpIf',0),
-- Module "SceMusicExport"
(-220000531,'SceMusicExport','SceMusicExport',0),
-- Module "SceNearDialogUtil"
(1698726005,'SceNearDialogUtil','SceNearDialogUtil',0),
-- Module "SceNearUtil"
(1443698184,'SceNearUtil','SceNearUtil',0),
-- Module "SceNet"
(1811460770,'SceNet','SceNet',0),
-- Module "SceNetAdhocMatching"
(9841226,'SceNetAdhocMatching','SceNetAdhocMatching',0),
-- Module "SceNetCtl"
(-972539167,'SceNetCtl','SceNetCtl',0),
-- Module "SceNetPs"
(-1297757920,'SceNetPs','SceNetPsForDriver',1),
(750703302,'SceNetPs','SceNetPsForSyscalls',0),
-- Module "SceNgs"
(-511549631,'SceNgs','SceNgsInternal',0),
-- Module "SceNgsUser"
(-1340761895,'SceNgsUser','SceNgs',0),
-- Module "SceNotificationUtil"
(-510617661,'SceNotificationUtil','SceNotificationUtil',0),
(-1464928293,'SceNotificationUtil','SceNotificationUtilBgApp',0),
(1969235817,'SceNotificationUtil','SceNotificationUtilProgress',0),
-- Module "SceNpActivity"
(-17526035,'SceNpActivity','SceNpActivity',0),
-- Module "SceNpBasic"
(1616619360,'SceNpBasic','SceNpBasic',0),
-- Module "SceNpCommerce2"
(1074924995,'SceNpCommerce2','SceNpCommerce2',0),
-- Module "SceNpCommon"
(-323608028,'SceNpCommon','SceNpCommon',0),
-- Module "SceNpDrm"
(-226911461,'SceNpDrm','SceNpDrm',0),
(-665992118,'SceNpDrm','SceNpDrmForDriver',1),
(-2007937614,'SceNpDrm','SceNpDrmPackage',0),
(1059784840,'SceNpDrm','ScePsmDrm',0),
(-1622596366,'SceNpDrm','ScePsmDrmForDriver',1),
-- Module "SceNpManager"
(-662482797,'SceNpManager','SceNpManager',0),
-- Module "SceNpMatching2"
(1896280835,'SceNpMatching2','SceNpMatching2',0),
-- Module "SceNpMessage"
(-2127293941,'SceNpMessage','SceNpMessage',0),
-- Module "SceNpParty"
(-1280096446,'SceNpParty','SceNpPartyGameUtil',0),
-- Module "SceNpScore"
(1978684123,'SceNpScore','SceNpScore',0),
-- Module "SceNpSignaling"
(-296092670,'SceNpSignaling','SceNpSignaling',0),
-- Module "SceNpSnsFacebook"
(519373240,'SceNpSnsFacebook','SceNpSnsFacebook',0),
-- Module "SceNpTrophy"
(1127399693,'SceNpTrophy','SceNpTrophy',0),
-- Module "SceNpTus"
(-1367032342,'SceNpTus','SceNpTus',0),
-- Module "SceNpUtility"
(2068306383,'SceNpUtility','SceNpUtility',0),
-- Module "SceNpWebApi"
(-508599684,'SceNpWebApi','SceNpWebApi',0),
-- Module "SceOled"
(1623672714,'SceOled','SceOledForDriver',1),
-- Module "ScePaf"
(1029979368,'ScePaf','ScePafMisc',0),
(674684059,'ScePaf','ScePafResource',0),
(-1479373394,'ScePaf','ScePafStdc',0),
(121605224,'ScePaf','ScePafWidget',0),
-- Module "ScePamgr"
(-1419743425,'ScePamgr','ScePamgr',0),
-- Module "ScePerf"
(1149174909,'ScePerf','ScePerf',0),
-- Module "ScePfsMgr"
(-1603816081,'ScePfsMgr','ScePfsMgrForKernel',1),
-- Module "ScePgf"
(-1623915278,'ScePgf','ScePgf',0),
-- Module "ScePhotoExport"
(2031512537,'ScePhotoExport','ScePhotoExport',0),
-- Module "ScePower"
(673977123,'ScePower','SceLedForDriver',1),
(277011071,'ScePower','ScePower',0),
(361764463,'ScePower','ScePowerForDriver',1),
-- Module "SceProcessmgr"
(769202194,'SceProcessmgr','SceProcessmgr',0),
(1953417585,'SceProcessmgr','SceProcessmgrForDriver',1),
(2053758598,'SceProcessmgr','SceProcessmgrForKernel',1),
-- Module "ScePromoterUtil"
(837957558,'ScePromoterUtil','ScePromoterUtil',0),
-- Module "ScePspnetAdhoc"
(432451548,'ScePspnetAdhoc','ScePspnetAdhoc',0),
-- Module "ScePvf"
(1758827104,'ScePvf','ScePvf',0),
-- Module "SceRazorCapture"
(2066366232,'SceRazorCapture','SceRazorCapture',0),
-- Module "SceRazorHud"
(620982722,'SceRazorHud','SceRazorHud',0),
-- Module "SceRegistryMgr"
(-1003030250,'SceRegistryMgr','SceRegMgr',0),
(-1306379541,'SceRegistryMgr','SceRegMgrForDriver',1),
(188027497,'SceRegistryMgr','SceRegMgrForGame',0),
(1743018007,'SceRegistryMgr','SceRegMgrForSDK',0),
(597757339,'SceRegistryMgr','SceRegMgrService',0),
(306388838,'SceRegistryMgr','SceRegMgrServiceForDriver',1),
-- Module "SceRtc"
(889407614,'SceRtc','SceRtc',0),
(55695399,'SceRtc','SceRtcForDriver',1),
(1728369606,'SceRtc','SceRtcUser',0),
-- Module "SceRudp"
(848366865,'SceRudp','SceLibRudp',0),
-- Module "SceSas"
(-297276349,'SceSas','SceSas',0),
-- Module "SceSblACMgr"
(-261492199,'SceSblACMgr','SceSblACMgr',0),
(-1697062381,'SceSblACMgr','SceSblACMgrForDriver',1),
(301576980,'SceSblACMgr','SceSblACMgrForKernel',1),
-- Module "SceSblAuthMgr"
(1320333755,'SceSblAuthMgr','SceSblAuthMgrForDriver',1),
(2059358517,'SceSblAuthMgr','SceSblAuthMgrForKernel',1),
-- Module "SceSblGcAuthMgr"
(2064891127,'SceSblGcAuthMgr','SceSblGcAuthMgr',0),
-- Module "SceSblPostSsMgr"
(1644706930,'SceSblPostSsMgr','SceSblLicMgr',0),
(-1446094955,'SceSblPostSsMgr','SceSblPmMgr',0),
(575988146,'SceSblPostSsMgr','SceSblPostSsMgrForDriver',1),
(1153823241,'SceSblPostSsMgr','SceSblRtcMgr',0),
(915482,'SceSblPostSsMgr','SceSblUtMgr',0),
-- Module "SceSblSmschedProxy"
(368204932,'SceSblSmschedProxy','SceSblSmSchedProxyForKernel',1),
-- Module "SceSblSsMgr"
(-730597016,'SceSblSsMgr','SceSblAimgr',0),
(1131636386,'SceSblSsMgr','SceSblDmac5Mgr',0),
(1969979017,'SceSblSsMgr','SceSblQafMgr',0),
(407105828,'SceSblSsMgr','SceSblRng',0),
(1642676877,'SceSblSsMgr','SceSblSsMgrForDriver',1),
(1951927711,'SceSblSsMgr','SceSblSsMgrForKernel',1),
-- Module "SceSblSsSmComm"
(-851670602,'SceSblSsSmComm','SceSblSmCommForKernel',1),
-- Module "SceSblUpdateMgr"
(826305609,'SceSblUpdateMgr','SceSblSsUpdateMgr',0),
-- Module "SceScreenShot"
(-227554947,'SceScreenShot','SceScreenShot',0),
-- Module "SceSdif"
(-1764555014,'SceSdif','SceSdifForDriver',1),
-- Module "SceShaccCg"
(-1604600133,'SceShaccCg','SceShaccCg',0),
-- Module "SceShellSvc"
(-760100690,'SceShellSvc','SceShellUtil',0),
(-1594031519,'SceShellSvc','SceShellUtilLaunchApp',0),
-- Module "SceShutterSound"
(-2022604307,'SceShutterSound','SceShutterSound',0),
-- Module "SceSmart"
(-1026234854,'SceSmart','SceSmart',0),
-- Module "SceSqlite"
(1743793693,'SceSqlite','SceSqlite',0),
-- Module "SceSsl"
(-889851159,'SceSsl','SceSsl',0),
-- Module "SceStdio"
(-1986568036,'SceStdio','SceStdio',0),
-- Module "SceSulpha"
(1396567006,'SceSulpha','SceSulpha',0),
-- Module "SceSyscon"
(1621319524,'SceSyscon','SceSysconForDriver',1),
-- Module "SceSysmem"
(1160139105,'SceSysmem','SceCpu',0),
(1089264398,'SceSysmem','SceCpuForDriver',1),
(1421814699,'SceSysmem','SceCpuForKernel',1),
(-2005564063,'SceSysmem','SceDebugForDriver',1),
(-2000587920,'SceSysmem','SceDebugForKernel',1),
(-1375712246,'SceSysmem','SceDebugLed',0),
(2076204717,'SceSysmem','SceDebugLedForDriver',1),
(-1284679390,'SceSysmem','SceDipsw',0),
(-907910264,'SceSysmem','SceDipswForDriver',1),
(1922085404,'SceSysmem','SceKernelSuspendForDriver',1),
(1231739060,'SceSysmem','SceKernelUtilsForDriver',1),
(-247516423,'SceSysmem','ScePmMgrForDriver',1),
(-2004936240,'SceSysmem','SceProcEventForDriver',1),
(1311364022,'SceSysmem','SceQafMgrForDriver',1),
(-50280806,'SceSysmem','SceSblAIMgrForDriver',1),
(2128892817,'SceSysmem','SceSysclibForDriver',1),
(939422298,'SceSysmem','SceSysmem',0),
(1864753546,'SceSysmem','SceSysmemForDriver',1),
(1671764453,'SceSysmem','SceSysmemForKernel',1),
(785906042,'SceSysmem','SceSysrootForDriver',1),
(915528261,'SceSysmem','SceSysrootForKernel',1),
(-1069695424,'SceSysmem','SceUartForKernel',1),
-- Module "SceSysmodule"
(66908573,'SceSysmodule','SceSysmodule',0),
-- Module "SceSystemGesture"
(-1354767661,'SceSystemGesture','SceSystemGesture',0),
-- Module "SceSystimer"
(-1535201126,'SceSystimer','SceSystimerForDriver',1),
-- Module "SceTeleportClient"
(-426790291,'SceTeleportClient','SceTeleportClient',0),
-- Module "SceTeleportServer"
(1576096296,'SceTeleportServer','SceTeleportServer',0),
-- Module "SceTouch"
(1045383809,'SceTouch','SceTouch',0),
(-1532503300,'SceTouch','SceTouchForDriver',1),
-- Module "SceTriggerUtil"
(453182125,'SceTriggerUtil','SceTriggerUtil',0),
-- Module "SceUdcd"
(-1471422838,'SceUdcd','SceUdcd',0),
(-1140479749,'SceUdcd','SceUdcdForDriver',1),
-- Module "SceUlobjMgr"
(-619136152,'SceUlobjMgr','SceUlobjMgr',0),
-- Module "SceUlt"
(570845349,'SceUlt','SceUlt',0),
-- Module "SceUsbPspcm"
(-1066781157,'SceUsbPspcm','SceUsbPspcm',0),
-- Module "SceUsbSerial"
(673190269,'SceUsbSerial','SceUsbSerial',0),
(-2010529037,'SceUsbSerial','SceUsbSerialForDriver',1),
-- Module "SceUsbServ"
(-633598224,'SceUsbServ','SceUsbServ',0),
-- Module "SceUsbd"
(-1595159999,'SceUsbd','SceUsbdForDriver',1),
(-1011963033,'SceUsbd','SceUsbdForUser',0),
-- Module "SceUsbstorVStorDriver"
(401773753,'SceUsbstorVStorDriver','SceUsbstorVStor',0),
-- Module "SceVideoExport"
(-259970436,'SceVideoExport','SceVideoExport',0),
-- Module "SceVideodec"
(373045031,'SceVideodec','SceVideodecUser',0),
-- Module "SceVoice"
(-833166828,'SceVoice','SceVoice',0),
-- Module "SceVoiceQoS"
(1694847420,'SceVoiceQoS','SceVoiceQoS',0),
-- Module "SceVshBridge"
(-11741569,'SceVshBridge','SceDrmBridge',0),
(902147284,'SceVshBridge','SceVshBridge',0),
-- Module "SceWlanBt"
(578952867,'SceWlanBt','SceWlan',0),
(-40567575,'SceWlanBt','SceWlanBtForDriver',1),
(NULL,NULL,NULL,NULL);
