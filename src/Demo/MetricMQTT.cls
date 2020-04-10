Class Demo.MetricMQTT Extends Ens.BusinessMetric
{

Parameter HISTORY = 50;

Property BPM As Ens.DataType.Metric;

Method OnCalculateMetrics() As %Status
{
    set patient = ..%Instance

    // find recent sales using SQL
     &SQL(SELECT TOP 1 BPM INTO :bpm
              FROM Demo.HeartRate
              WHERE PatientID = :patient ORDER BY TimeStamp DESC)
    
    set ..BPM = bpm

    return $$$OK
}

/// Return current list of product names
Query MetricInstances() As %SQLQuery
{
  select distinct patientID from Demo.HeartRate
}

}
