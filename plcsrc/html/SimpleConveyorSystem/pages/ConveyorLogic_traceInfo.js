function RTW_Sid2UrlHash() {
	this.urlHashMap = new Array();
	/* <S1>:6 */
	this.urlHashMap["SimpleConveyorSystem:1:6"] = "SimpleConveyorSystem.st:68,78,106";
	/* <S1>:7 */
	this.urlHashMap["SimpleConveyorSystem:1:7"] = "SimpleConveyorSystem.st:85";
	/* <S1>:8 */
	this.urlHashMap["SimpleConveyorSystem:1:8"] = "SimpleConveyorSystem.st:90,101";
	/* <S1>:12 */
	this.urlHashMap["SimpleConveyorSystem:1:12"] = "SimpleConveyorSystem.st:104";
	/* <S1>:9 */
	this.urlHashMap["SimpleConveyorSystem:1:9"] = "SimpleConveyorSystem.st:66";
	/* <S1>:10 */
	this.urlHashMap["SimpleConveyorSystem:1:10"] = "SimpleConveyorSystem.st:81";
	/* <S1>:11 */
	this.urlHashMap["SimpleConveyorSystem:1:11"] = "SimpleConveyorSystem.st:88";
	/* <S1>:6:2 */
	this.urlHashMap["SimpleConveyorSystem:1:6:2"] = "SimpleConveyorSystem.st:69,71,107,109";
	/* <S1>:10:1 */
	this.urlHashMap["SimpleConveyorSystem:1:10:1"] = "SimpleConveyorSystem.st:79";
	/* <S1>:11:1 */
	this.urlHashMap["SimpleConveyorSystem:1:11:1"] = "SimpleConveyorSystem.st:86";
	/* <S1>:8:2 */
	this.urlHashMap["SimpleConveyorSystem:1:8:2"] = "SimpleConveyorSystem.st:91,93";
	/* <S1>:7:2 */
	this.urlHashMap["SimpleConveyorSystem:1:7:2"] = "SimpleConveyorSystem.st:96";
	/* <S1>:12:1 */
	this.urlHashMap["SimpleConveyorSystem:1:12:1"] = "SimpleConveyorSystem.st:102";
	/* <S1>:8:3 */
	this.urlHashMap["SimpleConveyorSystem:1:8:3"] = "SimpleConveyorSystem.st:112";
	this.getUrlHash = function(sid) { return this.urlHashMap[sid];}
}
RTW_Sid2UrlHash.instance = new RTW_Sid2UrlHash();
function RTW_rtwnameSIDMap() {
	this.rtwnameHashMap = new Array();
	this.sidHashMap = new Array();
	this.rtwnameHashMap["<Root>"] = {sid: "SimpleConveyorSystem"};
	this.sidHashMap["SimpleConveyorSystem"] = {rtwname: "<Root>"};
	this.rtwnameHashMap["<S1>:6"] = {sid: "SimpleConveyorSystem:1:6"};
	this.sidHashMap["SimpleConveyorSystem:1:6"] = {rtwname: "<S1>:6"};
	this.rtwnameHashMap["<S1>:7"] = {sid: "SimpleConveyorSystem:1:7"};
	this.sidHashMap["SimpleConveyorSystem:1:7"] = {rtwname: "<S1>:7"};
	this.rtwnameHashMap["<S1>:8"] = {sid: "SimpleConveyorSystem:1:8"};
	this.sidHashMap["SimpleConveyorSystem:1:8"] = {rtwname: "<S1>:8"};
	this.rtwnameHashMap["<S1>:12"] = {sid: "SimpleConveyorSystem:1:12"};
	this.sidHashMap["SimpleConveyorSystem:1:12"] = {rtwname: "<S1>:12"};
	this.rtwnameHashMap["<S1>:9"] = {sid: "SimpleConveyorSystem:1:9"};
	this.sidHashMap["SimpleConveyorSystem:1:9"] = {rtwname: "<S1>:9"};
	this.rtwnameHashMap["<S1>:10"] = {sid: "SimpleConveyorSystem:1:10"};
	this.sidHashMap["SimpleConveyorSystem:1:10"] = {rtwname: "<S1>:10"};
	this.rtwnameHashMap["<S1>:11"] = {sid: "SimpleConveyorSystem:1:11"};
	this.sidHashMap["SimpleConveyorSystem:1:11"] = {rtwname: "<S1>:11"};
	this.rtwnameHashMap["<S1>:6:2"] = {sid: "SimpleConveyorSystem:1:6:2"};
	this.sidHashMap["SimpleConveyorSystem:1:6:2"] = {rtwname: "<S1>:6:2"};
	this.rtwnameHashMap["<S1>:10:1"] = {sid: "SimpleConveyorSystem:1:10:1"};
	this.sidHashMap["SimpleConveyorSystem:1:10:1"] = {rtwname: "<S1>:10:1"};
	this.rtwnameHashMap["<S1>:11:1"] = {sid: "SimpleConveyorSystem:1:11:1"};
	this.sidHashMap["SimpleConveyorSystem:1:11:1"] = {rtwname: "<S1>:11:1"};
	this.rtwnameHashMap["<S1>:8:2"] = {sid: "SimpleConveyorSystem:1:8:2"};
	this.sidHashMap["SimpleConveyorSystem:1:8:2"] = {rtwname: "<S1>:8:2"};
	this.rtwnameHashMap["<S1>:7:2"] = {sid: "SimpleConveyorSystem:1:7:2"};
	this.sidHashMap["SimpleConveyorSystem:1:7:2"] = {rtwname: "<S1>:7:2"};
	this.rtwnameHashMap["<S1>:12:1"] = {sid: "SimpleConveyorSystem:1:12:1"};
	this.sidHashMap["SimpleConveyorSystem:1:12:1"] = {rtwname: "<S1>:12:1"};
	this.rtwnameHashMap["<S1>:8:3"] = {sid: "SimpleConveyorSystem:1:8:3"};
	this.sidHashMap["SimpleConveyorSystem:1:8:3"] = {rtwname: "<S1>:8:3"};
	this.getSID = function(rtwname) { return this.rtwnameHashMap[rtwname];}
	this.getRtwname = function(sid) { return this.sidHashMap[sid];}
}
RTW_rtwnameSIDMap.instance = new RTW_rtwnameSIDMap();
