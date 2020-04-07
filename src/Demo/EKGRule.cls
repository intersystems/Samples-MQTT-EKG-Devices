/// 
Class Demo.EKGRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "Ens.Rule.GeneralBusinessRuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="" production="">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<assign property="PatientID" value="Piece(Topic,&quot;/&quot;,3,)"></assign>
</ruleSet>
</ruleDefinition>
}

}
