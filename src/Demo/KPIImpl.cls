Class Demo.KPIImpl Extends %DeepSee.KPI
{

XData KPI [ XMLNamespace = "http://www.intersystems.com/deepsee/kpi" ]
{
<kpi xmlns="http://www.intersystems.com/deepsee/kpi"
 name="KPIImpl" sourceType="sql"
 caption="MyCaption"
 sql="SELECT * from (SELECT TOP 1 BPM, TimeStamp from Demo.HeartRate WHERE PatientID = 'Patient-0' ORDER BY TimeStamp DESC) ORDER BY TimeStamp ASC"
>
<property name="BPM" displayName="BPM" columnNo="1"/>
<property name="TimeStamp" displayName="Time" columnNo="2"/>
</kpi>
}

}
