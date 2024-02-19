<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.6.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="99" name="SpiceOrder" color="5" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="GPIO">
<packages>
<package name="2X20-BOLD" urn="urn:adsk.eagle:footprint:36017741/1">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;
2x20-bold pad</description>
<wire x1="-25.4" y1="-1.905" x2="-24.765" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-24.765" y1="-2.54" x2="-23.495" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-23.495" y1="-2.54" x2="-22.86" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-22.86" y1="-1.905" x2="-22.225" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-22.225" y1="-2.54" x2="-20.955" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-20.955" y1="-2.54" x2="-20.32" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-20.32" y1="-1.905" x2="-19.685" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-19.685" y1="-2.54" x2="-18.415" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-18.415" y1="-2.54" x2="-17.78" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-17.78" y1="-1.905" x2="-17.145" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-17.145" y1="-2.54" x2="-15.875" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-15.875" y1="-2.54" x2="-15.24" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-15.24" y1="-1.905" x2="-14.605" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-14.605" y1="-2.54" x2="-13.335" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="-2.54" x2="-12.7" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="-1.905" x2="-12.065" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-12.065" y1="-2.54" x2="-10.795" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="-2.54" x2="-10.16" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-25.4" y1="-1.905" x2="-25.4" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-25.4" y1="1.905" x2="-24.765" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-24.765" y1="2.54" x2="-23.495" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-23.495" y1="2.54" x2="-22.86" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-22.86" y1="1.905" x2="-22.225" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-22.225" y1="2.54" x2="-20.955" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-20.955" y1="2.54" x2="-20.32" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-20.32" y1="1.905" x2="-19.685" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-19.685" y1="2.54" x2="-18.415" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-18.415" y1="2.54" x2="-17.78" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-17.78" y1="1.905" x2="-17.145" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-17.145" y1="2.54" x2="-15.875" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-15.875" y1="2.54" x2="-15.24" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-15.24" y1="1.905" x2="-14.605" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-14.605" y1="2.54" x2="-13.335" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="2.54" x2="-12.7" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="1.905" x2="-12.065" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-12.065" y1="2.54" x2="-10.795" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="2.54" x2="-10.16" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="1.905" x2="-9.525" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="2.54" x2="-8.255" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="2.54" x2="-7.62" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-6.985" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="2.54" x2="-5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="2.54" x2="-5.08" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.905" x2="-4.445" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="2.54" x2="-3.175" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="2.54" x2="-2.54" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.905" x2="-1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="2.54" x2="-0.635" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="2.54" x2="0" y2="1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="1.905" x2="0.635" y2="2.54" width="0.1524" layer="21"/>
<wire x1="0.635" y1="2.54" x2="1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="1.905" y1="2.54" x2="2.54" y2="1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.905" x2="3.175" y2="2.54" width="0.1524" layer="21"/>
<wire x1="3.175" y1="2.54" x2="4.445" y2="2.54" width="0.1524" layer="21"/>
<wire x1="5.08" y1="1.905" x2="4.445" y2="2.54" width="0.1524" layer="21"/>
<wire x1="5.08" y1="1.905" x2="5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="6.985" y1="2.54" x2="5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="6.985" y1="2.54" x2="7.62" y2="1.905" width="0.1524" layer="21"/>
<wire x1="7.62" y1="1.905" x2="8.255" y2="2.54" width="0.1524" layer="21"/>
<wire x1="9.525" y1="2.54" x2="8.255" y2="2.54" width="0.1524" layer="21"/>
<wire x1="9.525" y1="2.54" x2="10.16" y2="1.905" width="0.1524" layer="21"/>
<wire x1="10.16" y1="1.905" x2="10.795" y2="2.54" width="0.1524" layer="21"/>
<wire x1="12.065" y1="2.54" x2="10.795" y2="2.54" width="0.1524" layer="21"/>
<wire x1="12.065" y1="2.54" x2="12.7" y2="1.905" width="0.1524" layer="21"/>
<wire x1="12.7" y1="1.905" x2="13.335" y2="2.54" width="0.1524" layer="21"/>
<wire x1="14.605" y1="2.54" x2="13.335" y2="2.54" width="0.1524" layer="21"/>
<wire x1="14.605" y1="2.54" x2="15.24" y2="1.905" width="0.1524" layer="21"/>
<wire x1="15.24" y1="1.905" x2="15.875" y2="2.54" width="0.1524" layer="21"/>
<wire x1="17.145" y1="2.54" x2="15.875" y2="2.54" width="0.1524" layer="21"/>
<wire x1="17.145" y1="2.54" x2="17.78" y2="1.905" width="0.1524" layer="21"/>
<wire x1="17.78" y1="1.905" x2="18.415" y2="2.54" width="0.1524" layer="21"/>
<wire x1="19.685" y1="2.54" x2="18.415" y2="2.54" width="0.1524" layer="21"/>
<wire x1="19.685" y1="2.54" x2="20.32" y2="1.905" width="0.1524" layer="21"/>
<wire x1="20.32" y1="1.905" x2="20.955" y2="2.54" width="0.1524" layer="21"/>
<wire x1="22.225" y1="2.54" x2="20.955" y2="2.54" width="0.1524" layer="21"/>
<wire x1="22.225" y1="2.54" x2="22.86" y2="1.905" width="0.1524" layer="21"/>
<wire x1="22.86" y1="-1.905" x2="22.225" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="22.225" y1="-2.54" x2="20.955" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="20.32" y1="-1.905" x2="20.955" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="20.32" y1="-1.905" x2="19.685" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="19.685" y1="-2.54" x2="18.415" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="17.78" y1="-1.905" x2="18.415" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="17.78" y1="-1.905" x2="17.145" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="17.145" y1="-2.54" x2="15.875" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="15.24" y1="-1.905" x2="15.875" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="15.24" y1="-1.905" x2="14.605" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="13.335" y1="-2.54" x2="14.605" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="13.335" y1="-2.54" x2="12.7" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="12.7" y1="-1.905" x2="12.065" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="10.795" y1="-2.54" x2="12.065" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="10.795" y1="-2.54" x2="10.16" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-1.905" x2="9.525" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="9.525" y1="-2.54" x2="8.255" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="8.255" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="6.985" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-2.54" x2="5.715" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="5.715" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="4.445" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-2.54" x2="3.175" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="3.175" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-2.54" x2="0.635" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0.635" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="-0.635" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-2.54" x2="-1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-3.175" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-2.54" x2="-4.445" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-4.445" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-5.715" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-2.54" x2="-6.985" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-1.905" x2="-6.985" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-1.905" x2="-8.255" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="-2.54" x2="-9.525" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-1.905" x2="-9.525" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-22.86" y1="1.905" x2="-22.86" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-20.32" y1="1.905" x2="-20.32" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-17.78" y1="1.905" x2="-17.78" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-15.24" y1="1.905" x2="-15.24" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="1.905" x2="-12.7" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="1.905" x2="-10.16" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.905" x2="-5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.905" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="1.905" x2="5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="7.62" y1="1.905" x2="7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="10.16" y1="1.905" x2="10.16" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="12.7" y1="1.905" x2="12.7" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="15.24" y1="1.905" x2="15.24" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="17.78" y1="1.905" x2="17.78" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="20.32" y1="1.905" x2="20.32" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="22.86" y1="1.905" x2="22.86" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="22.86" y1="1.905" x2="23.495" y2="2.54" width="0.1524" layer="21"/>
<wire x1="24.765" y1="2.54" x2="23.495" y2="2.54" width="0.1524" layer="21"/>
<wire x1="24.765" y1="2.54" x2="25.4" y2="1.905" width="0.1524" layer="21"/>
<wire x1="25.4" y1="-1.905" x2="24.765" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="24.765" y1="-2.54" x2="23.495" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="22.86" y1="-1.905" x2="23.495" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="25.4" y1="1.905" x2="25.4" y2="-1.905" width="0.1524" layer="21"/>
<pad name="1" x="-24.13" y="-1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="2" x="-24.13" y="1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="3" x="-21.59" y="-1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="4" x="-21.59" y="1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="5" x="-19.05" y="-1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="6" x="-19.05" y="1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="7" x="-16.51" y="-1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="8" x="-16.51" y="1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="9" x="-13.97" y="-1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="10" x="-13.97" y="1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="11" x="-11.43" y="-1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="12" x="-11.43" y="1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="13" x="-8.89" y="-1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="14" x="-8.89" y="1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="15" x="-6.35" y="-1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="16" x="-6.35" y="1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="17" x="-3.81" y="-1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="18" x="-3.81" y="1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="19" x="-1.27" y="-1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="20" x="-1.27" y="1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="21" x="1.27" y="-1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="22" x="1.27" y="1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="23" x="3.81" y="-1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="24" x="3.81" y="1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="25" x="6.35" y="-1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="26" x="6.35" y="1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="27" x="8.89" y="-1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="28" x="8.89" y="1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="29" x="11.43" y="-1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="30" x="11.43" y="1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="31" x="13.97" y="-1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="32" x="13.97" y="1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="33" x="16.51" y="-1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="34" x="16.51" y="1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="35" x="19.05" y="-1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="36" x="19.05" y="1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="37" x="21.59" y="-1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="38" x="21.59" y="1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="39" x="24.13" y="-1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<pad name="40" x="24.13" y="1.27" drill="0.9" diameter="1.778" shape="octagon"/>
<text x="-25.4" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-25.4" y="-4.445" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-24.384" y1="-1.524" x2="-23.876" y2="-1.016" layer="51"/>
<rectangle x1="-24.384" y1="1.016" x2="-23.876" y2="1.524" layer="51"/>
<rectangle x1="-21.844" y1="1.016" x2="-21.336" y2="1.524" layer="51"/>
<rectangle x1="-21.844" y1="-1.524" x2="-21.336" y2="-1.016" layer="51"/>
<rectangle x1="-19.304" y1="1.016" x2="-18.796" y2="1.524" layer="51"/>
<rectangle x1="-19.304" y1="-1.524" x2="-18.796" y2="-1.016" layer="51"/>
<rectangle x1="-16.764" y1="1.016" x2="-16.256" y2="1.524" layer="51"/>
<rectangle x1="-14.224" y1="1.016" x2="-13.716" y2="1.524" layer="51"/>
<rectangle x1="-11.684" y1="1.016" x2="-11.176" y2="1.524" layer="51"/>
<rectangle x1="-16.764" y1="-1.524" x2="-16.256" y2="-1.016" layer="51"/>
<rectangle x1="-14.224" y1="-1.524" x2="-13.716" y2="-1.016" layer="51"/>
<rectangle x1="-11.684" y1="-1.524" x2="-11.176" y2="-1.016" layer="51"/>
<rectangle x1="-9.144" y1="1.016" x2="-8.636" y2="1.524" layer="51"/>
<rectangle x1="-9.144" y1="-1.524" x2="-8.636" y2="-1.016" layer="51"/>
<rectangle x1="-6.604" y1="1.016" x2="-6.096" y2="1.524" layer="51"/>
<rectangle x1="-6.604" y1="-1.524" x2="-6.096" y2="-1.016" layer="51"/>
<rectangle x1="-4.064" y1="1.016" x2="-3.556" y2="1.524" layer="51"/>
<rectangle x1="-4.064" y1="-1.524" x2="-3.556" y2="-1.016" layer="51"/>
<rectangle x1="-1.524" y1="1.016" x2="-1.016" y2="1.524" layer="51"/>
<rectangle x1="-1.524" y1="-1.524" x2="-1.016" y2="-1.016" layer="51"/>
<rectangle x1="1.016" y1="1.016" x2="1.524" y2="1.524" layer="51"/>
<rectangle x1="1.016" y1="-1.524" x2="1.524" y2="-1.016" layer="51"/>
<rectangle x1="3.556" y1="1.016" x2="4.064" y2="1.524" layer="51"/>
<rectangle x1="3.556" y1="-1.524" x2="4.064" y2="-1.016" layer="51"/>
<rectangle x1="6.096" y1="1.016" x2="6.604" y2="1.524" layer="51"/>
<rectangle x1="6.096" y1="-1.524" x2="6.604" y2="-1.016" layer="51"/>
<rectangle x1="8.636" y1="1.016" x2="9.144" y2="1.524" layer="51"/>
<rectangle x1="8.636" y1="-1.524" x2="9.144" y2="-1.016" layer="51"/>
<rectangle x1="11.176" y1="1.016" x2="11.684" y2="1.524" layer="51"/>
<rectangle x1="11.176" y1="-1.524" x2="11.684" y2="-1.016" layer="51"/>
<rectangle x1="13.716" y1="1.016" x2="14.224" y2="1.524" layer="51"/>
<rectangle x1="13.716" y1="-1.524" x2="14.224" y2="-1.016" layer="51"/>
<rectangle x1="16.256" y1="1.016" x2="16.764" y2="1.524" layer="51"/>
<rectangle x1="16.256" y1="-1.524" x2="16.764" y2="-1.016" layer="51"/>
<rectangle x1="18.796" y1="1.016" x2="19.304" y2="1.524" layer="51"/>
<rectangle x1="18.796" y1="-1.524" x2="19.304" y2="-1.016" layer="51"/>
<rectangle x1="21.336" y1="1.016" x2="21.844" y2="1.524" layer="51"/>
<rectangle x1="21.336" y1="-1.524" x2="21.844" y2="-1.016" layer="51"/>
<rectangle x1="23.876" y1="1.016" x2="24.384" y2="1.524" layer="51"/>
<rectangle x1="23.876" y1="-1.524" x2="24.384" y2="-1.016" layer="51"/>
</package>
</packages>
<packages3d>
<package3d name="2X20-BOLD" urn="urn:adsk.eagle:package:36017748/1" type="model">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;
2x20-bold pad</description>
<packageinstances>
<packageinstance name="2X20-BOLD"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="RASPBERRYPI-GPIO" urn="urn:adsk.eagle:symbol:36017744/1">
<pin name="3V3@1" x="-22.86" y="48.26" length="middle"/>
<pin name="5V@1" x="22.86" y="48.26" length="middle" rot="R180"/>
<pin name="GPIO2(SDA)" x="-22.86" y="43.18" length="middle"/>
<pin name="5V@2" x="22.86" y="43.18" length="middle" rot="R180"/>
<pin name="GPIO3(SCL)" x="-22.86" y="38.1" length="middle"/>
<pin name="GND@1" x="22.86" y="38.1" length="middle" rot="R180"/>
<pin name="GPIO4(GPCLK0)" x="-22.86" y="33.02" length="middle"/>
<pin name="GPIO14(TXD)" x="22.86" y="33.02" length="middle" rot="R180"/>
<pin name="GND@2" x="-22.86" y="27.94" length="middle"/>
<pin name="GPIO15(RXD)" x="22.86" y="27.94" length="middle" rot="R180"/>
<pin name="GPIO17" x="-22.86" y="22.86" length="middle"/>
<pin name="GPIO18(PCM_CLK)" x="22.86" y="22.86" length="middle" rot="R180"/>
<pin name="GPIO27" x="-22.86" y="17.78" length="middle"/>
<pin name="GND@3" x="22.86" y="17.78" length="middle" rot="R180"/>
<pin name="GPIO22" x="-22.86" y="12.7" length="middle"/>
<pin name="GPIO23" x="22.86" y="12.7" length="middle" rot="R180"/>
<pin name="3V3@2" x="-22.86" y="7.62" length="middle"/>
<pin name="GPIO24" x="22.86" y="7.62" length="middle" rot="R180"/>
<pin name="GPIO10(MOSI)" x="-22.86" y="2.54" length="middle"/>
<pin name="GND@4" x="22.86" y="2.54" length="middle" rot="R180"/>
<pin name="GPIO9(MISO)" x="-22.86" y="-2.54" length="middle"/>
<pin name="GPIO25" x="22.86" y="-2.54" length="middle" rot="R180"/>
<pin name="GPIO11(SCLK)" x="-22.86" y="-7.62" length="middle"/>
<pin name="GPIO8(CE0)" x="22.86" y="-7.62" length="middle" rot="R180"/>
<pin name="GND@5" x="-22.86" y="-12.7" length="middle"/>
<pin name="GPIO7(CE1)" x="22.86" y="-12.7" length="middle" rot="R180"/>
<pin name="GPIO0(ID_SD)" x="-22.86" y="-17.78" length="middle"/>
<pin name="GPIO1(ID_SC)" x="22.86" y="-17.78" length="middle" rot="R180"/>
<pin name="GPIO5" x="-22.86" y="-22.86" length="middle"/>
<pin name="GND@6" x="22.86" y="-22.86" length="middle" rot="R180"/>
<pin name="GPIO6" x="-22.86" y="-27.94" length="middle"/>
<pin name="GPIO12(PWM0)" x="22.86" y="-27.94" length="middle" rot="R180"/>
<pin name="GPIO13(PWM1)" x="-22.86" y="-33.02" length="middle"/>
<pin name="GND@7" x="22.86" y="-33.02" length="middle" rot="R180"/>
<pin name="GPIO19(PCM_FS)" x="-22.86" y="-38.1" length="middle"/>
<pin name="GPIO16" x="22.86" y="-38.1" length="middle" rot="R180"/>
<pin name="GPIO26" x="-22.86" y="-43.18" length="middle"/>
<pin name="GPIO20(PCM_DIN)" x="22.86" y="-43.18" length="middle" rot="R180"/>
<pin name="GND@8" x="-22.86" y="-48.26" length="middle"/>
<pin name="GPIO21(PCM_DOUT)" x="22.86" y="-48.26" length="middle" rot="R180"/>
<wire x1="-17.78" y1="50.8" x2="17.78" y2="50.8" width="0.254" layer="94"/>
<wire x1="17.78" y1="50.8" x2="17.78" y2="-50.8" width="0.254" layer="94"/>
<wire x1="17.78" y1="-50.8" x2="-17.78" y2="-50.8" width="0.254" layer="94"/>
<wire x1="-17.78" y1="-50.8" x2="-17.78" y2="50.8" width="0.254" layer="94"/>
<text x="-17.78" y="51.308" size="1.778" layer="95">&gt;NAME</text>
<text x="7.62" y="51.308" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="RASPBERRYPI-GPIO" urn="urn:adsk.eagle:component:36017749/1" prefix="CN">
<gates>
<gate name="G$1" symbol="RASPBERRYPI-GPIO" x="0" y="0"/>
</gates>
<devices>
<device name="" package="2X20-BOLD">
<connects>
<connect gate="G$1" pin="3V3@1" pad="1"/>
<connect gate="G$1" pin="3V3@2" pad="17"/>
<connect gate="G$1" pin="5V@1" pad="2"/>
<connect gate="G$1" pin="5V@2" pad="4"/>
<connect gate="G$1" pin="GND@1" pad="6"/>
<connect gate="G$1" pin="GND@2" pad="9"/>
<connect gate="G$1" pin="GND@3" pad="14"/>
<connect gate="G$1" pin="GND@4" pad="20"/>
<connect gate="G$1" pin="GND@5" pad="25"/>
<connect gate="G$1" pin="GND@6" pad="30"/>
<connect gate="G$1" pin="GND@7" pad="34"/>
<connect gate="G$1" pin="GND@8" pad="39"/>
<connect gate="G$1" pin="GPIO0(ID_SD)" pad="27"/>
<connect gate="G$1" pin="GPIO1(ID_SC)" pad="28"/>
<connect gate="G$1" pin="GPIO10(MOSI)" pad="19"/>
<connect gate="G$1" pin="GPIO11(SCLK)" pad="23"/>
<connect gate="G$1" pin="GPIO12(PWM0)" pad="32"/>
<connect gate="G$1" pin="GPIO13(PWM1)" pad="33"/>
<connect gate="G$1" pin="GPIO14(TXD)" pad="8"/>
<connect gate="G$1" pin="GPIO15(RXD)" pad="10"/>
<connect gate="G$1" pin="GPIO16" pad="36"/>
<connect gate="G$1" pin="GPIO17" pad="11"/>
<connect gate="G$1" pin="GPIO18(PCM_CLK)" pad="12"/>
<connect gate="G$1" pin="GPIO19(PCM_FS)" pad="35"/>
<connect gate="G$1" pin="GPIO2(SDA)" pad="3"/>
<connect gate="G$1" pin="GPIO20(PCM_DIN)" pad="38"/>
<connect gate="G$1" pin="GPIO21(PCM_DOUT)" pad="40"/>
<connect gate="G$1" pin="GPIO22" pad="15"/>
<connect gate="G$1" pin="GPIO23" pad="16"/>
<connect gate="G$1" pin="GPIO24" pad="18"/>
<connect gate="G$1" pin="GPIO25" pad="22"/>
<connect gate="G$1" pin="GPIO26" pad="37"/>
<connect gate="G$1" pin="GPIO27" pad="13"/>
<connect gate="G$1" pin="GPIO3(SCL)" pad="5"/>
<connect gate="G$1" pin="GPIO4(GPCLK0)" pad="7"/>
<connect gate="G$1" pin="GPIO5" pad="29"/>
<connect gate="G$1" pin="GPIO6" pad="31"/>
<connect gate="G$1" pin="GPIO7(CE1)" pad="26"/>
<connect gate="G$1" pin="GPIO8(CE0)" pad="24"/>
<connect gate="G$1" pin="GPIO9(MISO)" pad="21"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:36017748/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="jst-xh">
<description>&lt;b&gt;JST Connectors XH Series&lt;/b&gt;
&lt;p&gt;
&lt;author&gt;Created by yuhki50@gmail.com&lt;/author&gt;
&lt;/p&gt;</description>
<packages>
<package name="B2B-XH-A" urn="urn:adsk.eagle:footprint:36017573/1">
<wire x1="-3.7" y1="2.35" x2="-3.7" y2="1.55" width="0.1524" layer="21"/>
<wire x1="-3.7" y1="1.55" x2="-3.7" y2="0.25" width="0.1524" layer="21"/>
<wire x1="-3.7" y1="0.25" x2="-3.7" y2="-3.4" width="0.1524" layer="21"/>
<wire x1="-3.7" y1="2.35" x2="-1.47" y2="2.35" width="0.1524" layer="21"/>
<wire x1="-1.47" y1="2.35" x2="1.47" y2="2.35" width="0.1524" layer="21"/>
<wire x1="1.47" y1="2.35" x2="3.7" y2="2.35" width="0.1524" layer="21"/>
<wire x1="3.7" y1="-3.4" x2="-3.7" y2="-3.4" width="0.1524" layer="21"/>
<wire x1="3.7" y1="2.35" x2="3.7" y2="1.55" width="0.1524" layer="21"/>
<wire x1="3.7" y1="1.55" x2="3.7" y2="0.25" width="0.1524" layer="21"/>
<wire x1="3.7" y1="0.25" x2="3.7" y2="-3.4" width="0.1524" layer="21"/>
<wire x1="-3.7" y1="0.25" x2="-3.175" y2="0.25" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="0.25" x2="-3.175" y2="-2.875" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-2.875" x2="3.175" y2="-2.875" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-2.875" x2="3.175" y2="0.25" width="0.1524" layer="21"/>
<wire x1="3.175" y1="0.25" x2="3.7" y2="0.25" width="0.1524" layer="21"/>
<wire x1="-3.7" y1="1.55" x2="-1.47" y2="1.55" width="0.1524" layer="21"/>
<wire x1="-1.47" y1="1.55" x2="-1.47" y2="2.35" width="0.1524" layer="21"/>
<wire x1="1.47" y1="2.35" x2="1.47" y2="1.55" width="0.1524" layer="21"/>
<wire x1="1.47" y1="1.55" x2="3.7" y2="1.55" width="0.1524" layer="21"/>
<pad name="1" x="-1.25" y="0" drill="1.016" diameter="1.778" shape="square" rot="R90"/>
<pad name="2" x="1.25" y="0" drill="1.016" diameter="1.778" rot="R90"/>
<text x="-3.7" y="3.5" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.7" y="-5.5" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="B3B-XH-A" urn="urn:adsk.eagle:footprint:36017566/1">
<wire x1="-4.95" y1="2.35" x2="-4.95" y2="1.55" width="0.1524" layer="21"/>
<wire x1="-4.95" y1="1.55" x2="-4.95" y2="0.25" width="0.1524" layer="21"/>
<wire x1="-4.95" y1="0.25" x2="-4.95" y2="-3.4" width="0.1524" layer="21"/>
<wire x1="-4.95" y1="2.35" x2="-2.72" y2="2.35" width="0.1524" layer="21"/>
<wire x1="-2.72" y1="2.35" x2="2.72" y2="2.35" width="0.1524" layer="21"/>
<wire x1="2.72" y1="2.35" x2="4.95" y2="2.35" width="0.1524" layer="21"/>
<wire x1="4.95" y1="-3.4" x2="-4.95" y2="-3.4" width="0.1524" layer="21"/>
<wire x1="4.95" y1="2.35" x2="4.95" y2="1.55" width="0.1524" layer="21"/>
<wire x1="4.95" y1="1.55" x2="4.95" y2="0.25" width="0.1524" layer="21"/>
<wire x1="4.95" y1="0.25" x2="4.95" y2="-3.4" width="0.1524" layer="21"/>
<wire x1="-4.95" y1="0.25" x2="-4.425" y2="0.25" width="0.1524" layer="21"/>
<wire x1="-4.425" y1="0.25" x2="-4.425" y2="-2.875" width="0.1524" layer="21"/>
<wire x1="-4.425" y1="-2.875" x2="4.425" y2="-2.875" width="0.1524" layer="21"/>
<wire x1="4.425" y1="-2.875" x2="4.425" y2="0.25" width="0.1524" layer="21"/>
<wire x1="4.425" y1="0.25" x2="4.95" y2="0.25" width="0.1524" layer="21"/>
<wire x1="-4.95" y1="1.55" x2="-2.72" y2="1.55" width="0.1524" layer="21"/>
<wire x1="-2.72" y1="1.55" x2="-2.72" y2="2.35" width="0.1524" layer="21"/>
<wire x1="2.72" y1="2.35" x2="2.72" y2="1.55" width="0.1524" layer="21"/>
<wire x1="2.72" y1="1.55" x2="4.95" y2="1.55" width="0.1524" layer="21"/>
<pad name="1" x="-2.5" y="0" drill="1.016" shape="square" rot="R90"/>
<pad name="2" x="0" y="0" drill="1.016" rot="R90"/>
<pad name="3" x="2.5" y="0" drill="1.016" rot="R90"/>
<text x="-4.95" y="3.5" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.95" y="-5.5" size="1.27" layer="27">&gt;VALUE</text>
</package>
</packages>
<packages3d>
<package3d name="B2B-XH-A" urn="urn:adsk.eagle:package:36017608/1" type="model">
<packageinstances>
<packageinstance name="B2B-XH-A"/>
</packageinstances>
</package3d>
<package3d name="B3B-XH-A" urn="urn:adsk.eagle:package:36017582/1" type="box">
<packageinstances>
<packageinstance name="B3B-XH-A"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="CON-1X2" urn="urn:adsk.eagle:symbol:36017530/1">
<wire x1="-3.81" y1="-5.08" x2="3.81" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-5.08" x2="3.81" y2="2.54" width="0.4064" layer="94"/>
<wire x1="3.81" y1="2.54" x2="-3.81" y2="2.54" width="0.4064" layer="94"/>
<wire x1="-3.81" y1="2.54" x2="-3.81" y2="-5.08" width="0.4064" layer="94"/>
<text x="-3.81" y="3.81" size="1.778" layer="95">&gt;NAME</text>
<text x="-3.81" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="0" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="0" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
<symbol name="CON-1X3" urn="urn:adsk.eagle:symbol:36017537/1">
<wire x1="-3.81" y1="-5.08" x2="3.81" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-5.08" x2="3.81" y2="5.08" width="0.4064" layer="94"/>
<wire x1="3.81" y1="5.08" x2="-3.81" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-3.81" y1="5.08" x2="-3.81" y2="-5.08" width="0.4064" layer="94"/>
<text x="-3.81" y="6.35" size="1.778" layer="95">&gt;NAME</text>
<text x="-3.81" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="0" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="0" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="0" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="B2B-XH-A" urn="urn:adsk.eagle:component:36017621/1" prefix="CN" uservalue="yes">
<description>&lt;b&gt;Wire-to-Board 2.5mm pitch top mount connector&lt;/b&gt;
&lt;p&gt;
Source:
&lt;ul&gt;
&lt;li&gt;http://www.jst-mfg.com/product/pdf/jpn/XH.pdf&lt;/li&gt;
&lt;li&gt;http://www.jst-mfg.com/product/detail.php?series=277&lt;/li&gt;
&lt;ul&gt;
&lt;/p&gt;</description>
<gates>
<gate name="G$1" symbol="CON-1X2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="B2B-XH-A">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:36017608/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="B3B-XH-A" urn="urn:adsk.eagle:component:36017630/1" prefix="CN" uservalue="yes">
<description>&lt;b&gt;Wire-to-Board 2.5mm pitch top mount connector&lt;/b&gt;
&lt;p&gt;
Source:
&lt;ul&gt;
&lt;li&gt;http://www.jst-mfg.com/product/pdf/jpn/XH.pdf&lt;/li&gt;
&lt;li&gt;http://www.jst-mfg.com/product/detail.php?series=277&lt;/li&gt;
&lt;ul&gt;
&lt;/p&gt;</description>
<gates>
<gate name="G$1" symbol="CON-1X3" x="0" y="0"/>
</gates>
<devices>
<device name="" package="B3B-XH-A">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:36017582/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="CN1" library="GPIO" deviceset="RASPBERRYPI-GPIO" device="" package3d_urn="urn:adsk.eagle:package:36017748/1"/>
<part name="OP_SW" library="jst-xh" deviceset="B2B-XH-A" device="" package3d_urn="urn:adsk.eagle:package:36017608/1"/>
<part name="RST_SW" library="jst-xh" deviceset="B2B-XH-A" device="" package3d_urn="urn:adsk.eagle:package:36017608/1"/>
<part name="READ_SW" library="jst-xh" deviceset="B2B-XH-A" device="" package3d_urn="urn:adsk.eagle:package:36017608/1"/>
<part name="SABO" library="jst-xh" deviceset="B3B-XH-A" device="" package3d_urn="urn:adsk.eagle:package:36017582/1"/>
<part name="SABO1" library="jst-xh" deviceset="B3B-XH-A" device="" package3d_urn="urn:adsk.eagle:package:36017582/1"/>
<part name="CL_SW" library="jst-xh" deviceset="B2B-XH-A" device="" package3d_urn="urn:adsk.eagle:package:36017608/1"/>
<part name="SA_PO_SW" library="jst-xh" deviceset="B2B-XH-A" device="" package3d_urn="urn:adsk.eagle:package:36017608/1"/>
<part name="READ_SW_SW" library="jst-xh" deviceset="B2B-XH-A" device="" package3d_urn="urn:adsk.eagle:package:36017608/1"/>
<part name="PO" library="jst-xh" deviceset="B2B-XH-A" device="" package3d_urn="urn:adsk.eagle:package:36017608/1"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="CN1" gate="G$1" x="106.68" y="45.72" smashed="yes">
<attribute name="NAME" x="88.9" y="97.028" size="1.778" layer="95"/>
<attribute name="VALUE" x="114.3" y="97.028" size="1.778" layer="96"/>
</instance>
<instance part="OP_SW" gate="G$1" x="30.48" y="93.98" smashed="yes">
<attribute name="NAME" x="26.67" y="97.79" size="1.778" layer="95"/>
<attribute name="VALUE" x="26.67" y="86.36" size="1.778" layer="96"/>
</instance>
<instance part="RST_SW" gate="G$1" x="30.48" y="68.58" smashed="yes">
<attribute name="NAME" x="26.67" y="72.39" size="1.778" layer="95"/>
<attribute name="VALUE" x="26.67" y="60.96" size="1.778" layer="96"/>
</instance>
<instance part="READ_SW" gate="G$1" x="30.48" y="48.26" smashed="yes">
<attribute name="NAME" x="26.67" y="52.07" size="1.778" layer="95"/>
<attribute name="VALUE" x="26.67" y="40.64" size="1.778" layer="96"/>
</instance>
<instance part="SABO" gate="G$1" x="30.48" y="35.56" smashed="yes">
<attribute name="NAME" x="26.67" y="41.91" size="1.778" layer="95"/>
<attribute name="VALUE" x="26.67" y="27.94" size="1.778" layer="96"/>
</instance>
<instance part="SABO1" gate="G$1" x="30.48" y="20.32" smashed="yes">
<attribute name="NAME" x="26.67" y="26.67" size="1.778" layer="95"/>
<attribute name="VALUE" x="26.67" y="12.7" size="1.778" layer="96"/>
</instance>
<instance part="CL_SW" gate="G$1" x="30.48" y="83.82" smashed="yes">
<attribute name="NAME" x="26.67" y="87.63" size="1.778" layer="95"/>
<attribute name="VALUE" x="26.67" y="76.2" size="1.778" layer="96"/>
</instance>
<instance part="SA_PO_SW" gate="G$1" x="30.48" y="5.08" smashed="yes">
<attribute name="NAME" x="26.67" y="8.89" size="1.778" layer="95"/>
<attribute name="VALUE" x="26.67" y="-2.54" size="1.778" layer="96"/>
</instance>
<instance part="READ_SW_SW" gate="G$1" x="30.48" y="58.42" smashed="yes">
<attribute name="NAME" x="26.67" y="62.23" size="1.778" layer="95"/>
<attribute name="VALUE" x="26.67" y="50.8" size="1.778" layer="96"/>
</instance>
<instance part="PO" gate="G$1" x="30.48" y="-7.62" smashed="yes">
<attribute name="NAME" x="26.67" y="-3.81" size="1.778" layer="95"/>
<attribute name="VALUE" x="26.67" y="-15.24" size="1.778" layer="96"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<pinref part="OP_SW" gate="G$1" pin="1"/>
<wire x1="30.48" y1="93.98" x2="73.66" y2="93.98" width="0.1524" layer="91"/>
<wire x1="73.66" y1="93.98" x2="73.66" y2="43.18" width="0.1524" layer="91"/>
<pinref part="CN1" gate="G$1" pin="GPIO9(MISO)"/>
<wire x1="73.66" y1="43.18" x2="83.82" y2="43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="CN1" gate="G$1" pin="GPIO3(SCL)"/>
<wire x1="66.04" y1="83.82" x2="83.82" y2="83.82" width="0.1524" layer="91"/>
<pinref part="READ_SW_SW" gate="G$1" pin="1"/>
<wire x1="66.04" y1="83.82" x2="66.04" y2="58.42" width="0.1524" layer="91"/>
<wire x1="66.04" y1="58.42" x2="30.48" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<wire x1="71.12" y1="45.72" x2="71.12" y2="66.04" width="0.1524" layer="91"/>
<pinref part="CN1" gate="G$1" pin="GND@2"/>
<wire x1="71.12" y1="66.04" x2="71.12" y2="73.66" width="0.1524" layer="91"/>
<wire x1="71.12" y1="73.66" x2="83.82" y2="73.66" width="0.1524" layer="91"/>
<pinref part="READ_SW" gate="G$1" pin="2"/>
<wire x1="30.48" y1="45.72" x2="71.12" y2="45.72" width="0.1524" layer="91"/>
<pinref part="CL_SW" gate="G$1" pin="2"/>
<wire x1="30.48" y1="81.28" x2="63.5" y2="81.28" width="0.1524" layer="91"/>
<wire x1="63.5" y1="81.28" x2="71.12" y2="81.28" width="0.1524" layer="91"/>
<wire x1="71.12" y1="81.28" x2="71.12" y2="73.66" width="0.1524" layer="91"/>
<junction x="71.12" y="73.66"/>
<pinref part="OP_SW" gate="G$1" pin="2"/>
<wire x1="30.48" y1="91.44" x2="63.5" y2="91.44" width="0.1524" layer="91"/>
<wire x1="63.5" y1="91.44" x2="63.5" y2="81.28" width="0.1524" layer="91"/>
<junction x="63.5" y="81.28"/>
<pinref part="RST_SW" gate="G$1" pin="2"/>
<wire x1="30.48" y1="66.04" x2="71.12" y2="66.04" width="0.1524" layer="91"/>
<junction x="71.12" y="66.04"/>
</segment>
<segment>
<pinref part="SABO" gate="G$1" pin="1"/>
<wire x1="30.48" y1="38.1" x2="40.64" y2="38.1" width="0.1524" layer="91"/>
<wire x1="40.64" y1="38.1" x2="40.64" y2="22.86" width="0.1524" layer="91"/>
<wire x1="40.64" y1="22.86" x2="40.64" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="SABO1" gate="G$1" pin="1"/>
<wire x1="30.48" y1="22.86" x2="40.64" y2="22.86" width="0.1524" layer="91"/>
<junction x="40.64" y="22.86"/>
<wire x1="30.48" y1="-10.16" x2="40.64" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="PO" gate="G$1" pin="2"/>
<wire x1="40.64" y1="22.86" x2="73.66" y2="22.86" width="0.1524" layer="91"/>
<pinref part="CN1" gate="G$1" pin="GND@8"/>
<wire x1="73.66" y1="-2.54" x2="83.82" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="73.66" y1="22.86" x2="73.66" y2="-2.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<wire x1="78.74" y1="33.02" x2="78.74" y2="7.62" width="0.1524" layer="91"/>
<pinref part="CN1" gate="G$1" pin="GPIO19(PCM_FS)"/>
<wire x1="78.74" y1="7.62" x2="83.82" y2="7.62" width="0.1524" layer="91"/>
<pinref part="SABO" gate="G$1" pin="3"/>
<wire x1="30.48" y1="33.02" x2="78.74" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="SABO" gate="G$1" pin="2"/>
<wire x1="30.48" y1="35.56" x2="45.72" y2="35.56" width="0.1524" layer="91"/>
<wire x1="45.72" y1="35.56" x2="45.72" y2="20.32" width="0.1524" layer="91"/>
<wire x1="45.72" y1="20.32" x2="45.72" y2="2.54" width="0.1524" layer="91"/>
<wire x1="45.72" y1="2.54" x2="30.48" y2="2.54" width="0.1524" layer="91"/>
<pinref part="SABO1" gate="G$1" pin="2"/>
<wire x1="30.48" y1="20.32" x2="45.72" y2="20.32" width="0.1524" layer="91"/>
<junction x="45.72" y="20.32"/>
<pinref part="SA_PO_SW" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="SABO1" gate="G$1" pin="3"/>
<pinref part="CN1" gate="G$1" pin="GPIO6"/>
<wire x1="30.48" y1="17.78" x2="83.82" y2="17.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<wire x1="30.48" y1="-7.62" x2="25.4" y2="-7.62" width="0.1524" layer="91"/>
<wire x1="25.4" y1="-7.62" x2="25.4" y2="5.08" width="0.1524" layer="91"/>
<wire x1="25.4" y1="5.08" x2="30.48" y2="5.08" width="0.1524" layer="91"/>
<pinref part="SA_PO_SW" gate="G$1" pin="1"/>
<pinref part="PO" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="READ_SW_SW" gate="G$1" pin="2"/>
<wire x1="30.48" y1="55.88" x2="43.18" y2="55.88" width="0.1524" layer="91"/>
<wire x1="43.18" y1="55.88" x2="43.18" y2="48.26" width="0.1524" layer="91"/>
<pinref part="READ_SW" gate="G$1" pin="1"/>
<wire x1="43.18" y1="48.26" x2="30.48" y2="48.26" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="RST_SW" gate="G$1" pin="1"/>
<wire x1="30.48" y1="68.58" x2="76.2" y2="68.58" width="0.1524" layer="91"/>
<pinref part="CN1" gate="G$1" pin="GPIO27"/>
<wire x1="76.2" y1="68.58" x2="76.2" y2="63.5" width="0.1524" layer="91"/>
<wire x1="76.2" y1="63.5" x2="83.82" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="CL_SW" gate="G$1" pin="1"/>
<wire x1="30.48" y1="83.82" x2="30.48" y2="86.36" width="0.1524" layer="91"/>
<wire x1="30.48" y1="86.36" x2="83.82" y2="86.36" width="0.1524" layer="91"/>
<pinref part="CN1" gate="G$1" pin="GPIO2(SDA)"/>
<wire x1="83.82" y1="86.36" x2="83.82" y2="88.9" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
