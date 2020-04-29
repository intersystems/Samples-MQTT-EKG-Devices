Include %DeepSee

Class Solution.Dashboard Extends %DeepSee.UserLibrary.Container [ Not ProcedureBlock ]
{

/// Items Exported From Folder Manager.
XData Contents [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<items><dashboard xmlns="http://www.intersystems.com/deepsee/library" name="EKG" folderName="" title="" description="" keywords="" owner="" shared="true" public="true" locked="false" resource="" timeCreated="2020-04-10T13:27:00.586Z" createdBy="SuperUser" category="" bookCover="" scheme="" worklistCount="2" snapTo="true" snapGrid="true" gridRows="10" gridCols="10" canResize="true" canModify="true" showTitleBar="true" titleBarOpacity="" titleBarColor="" selectedTitleBarOpacity="" selectedTitleBarColor="" titleBarTextColor="" selectedTitleBarTextColor="" titleBarFont="" companyName="" companyLogo="" companyStyle="" backgroundColor="white" backgroundImage="none" backgroundRepeat="no-repeat" backgroundSize="100% 100%" backgroundOpacity="1" widgetBorders="1px solid #F0F0F0" widgetBordersSwitch="edit" widgetBordersColor="#F0F0F0" widgetBordersStyle="solid" widgetBordersWidth="1" widgetBordersToggle="true">
  <widget name="EKGReadings" type="pivot" subtype="columnChart" subtypeClass="barChart" title="" dataSource="Solution.MQTT/Solution.MetricMQTT.metric" dataLink="" drillDownDataSource="" width="200" height="200" sidebarContent="" showSidebar="false" sidebarWidth="" maximized="false" homeRowL="0" homeColL="0" colSpanL="7" rowSpanL="5" showToolbar="true" showToolbarBottomBorder="true" showToolbarOnlyWhenMaximized="false" colorToolbar="#F0F0F0" opacityToolbar="1" backgroundColor="#F0F0F0" opacity="1" theme="" dataColorList="">
    <control name="" action="refresh" target="*" targetProperty="" location="widget" type="timer" controlClass="" timeout="1" label="" title="" value="" text="" readOnly="false" valueList="" displayList="" activeWhen="">
      <valueRequired>false</valueRequired>
    </control>
    <dataProperty name="" label="" width="" align="" subtype="" style="" display="" format="" showAs="" valueColumn="false" summary="" summaryValue="" dataValue="BPM" targetValue="" thresholdLower="" thresholdUpper="" rangeLower="" rangeUpper="" baseValue="" override=""></dataProperty>
    <override name="barChart">{legendVisible:'false',xAxis:{_type:'axis'},yAxisList:[{_type:'axis'}],_type:'barChart'}</override>
  </widget>
</dashboard>
</items>
}

}
