
/// Production response class. Target of data transformation
/// that converts from MQTT topic and payload into a persistent object.
Class Demo.HeartRate Extends (Ens.Response)
{

Property PatientID As %String;

Property BPM As %Integer;

// Initialize all HeartRate objects with a timestamp.
Property TimeStamp As %DateTime [ InitialExpression = {$ZDATETIME($ZTIMESTAMP)} ];

}
