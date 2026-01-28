function RTW_SidParentMap() {
    this.sidParentMap = new Array();
    this.sidParentMap["dspmultichannelhdl:15"] = "dspmultichannelhdl:14";
    this.sidParentMap["dspmultichannelhdl:4"] = "dspmultichannelhdl:14";
    this.sidParentMap["dspmultichannelhdl:16"] = "dspmultichannelhdl:14";
    this.getParentSid = function(sid) { return this.sidParentMap[sid];}
}
    RTW_SidParentMap.instance = new RTW_SidParentMap();
