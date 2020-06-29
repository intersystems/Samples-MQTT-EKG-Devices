/// Business metric class. For documentation on the business metric parent class
/// see https://docs.intersystems.com/irisforhealthlatest/csp/docbook/DocBook.UI.Page.cls?KEY=EGDV_bmetric
Class Demo.MetricMQTT Extends Ens.BusinessMetric
{

// property that stores the current value for every instance of this business

// metric.

Property BPM As Ens.DataType.Metric;

/// Dynamically runs query and breaks
/// metric data down by instance, in this case
/// associating a BPM with a specific patient in the database.
Query MetricInstances() As %SQLQuery
{
  select distinct patientID from Demo.HeartRate
}

/// This method runs periodically on an interval set using the 'Call Interval'
/// setting in the management portal.
Method OnCalculateMetrics() As %Status
{
    // This method is called for each instance. 
    // set the patient id by accessing instance name and query HeartRate table
    // for data associated with that patient
    set patient = ..%Instance

    // Find the most recent BPM reading and assign it to the locally scoped 'bpm' variable.
     &SQL(SELECT TOP 1 BPM INTO :bpm
              FROM Demo.HeartRate
              WHERE PatientID = :patient ORDER BY TimeStamp DESC)
    
    // Update the BPM property for that instance based on the result of the query.
    set ..BPM = bpm

    return $$$OK
}

}
