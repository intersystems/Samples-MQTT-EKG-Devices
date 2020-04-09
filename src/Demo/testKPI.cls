Class Demo.testKPI Extends %DeepSee.KPI
{

XData KPI [ XMLNamespace = "http://www.intersystems.com/deepsee/kpi" ]
{
<kpi xmlns="http://www.intersystems.com/deepsee/kpi"
 name="testKPI" sourceType="sql"
 caption="TEST"
 sql="SELECT * from Demo.dummyData"
 >
<property name="distance" displayName="distance" columnNo="1"/>
<property name="time" displayName="Time" columnNo="2"/>
</kpi>
}

}
