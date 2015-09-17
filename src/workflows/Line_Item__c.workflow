<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Copy_Unit_Price</fullName>
        <field>Unit_Prices__c</field>
        <formula>Merchandise__r.Price__c</formula>
        <name>Copy Unit Price</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Stock_Inventory</fullName>
        <field>Quantity__c</field>
        <name>Update Stock Inventory</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>Merchandise__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_Stock_Inventory1</fullName>
        <field>Quantity1__c</field>
        <formula>Merchandise__r.Quantity1__c  -  Quantity__c</formula>
        <name>update Stock Inventory</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Merchandise__c</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Populate unit price</fullName>
        <actions>
            <name>Copy_Unit_Price</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Line_Item__c.Quantity__c</field>
            <operation>greaterOrEqual</operation>
            <value>1</value>
        </criteriaItems>
        <description>Populates  Line item objects unit price field with value of Merchandise object &apos;s price field</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Populate unit price1</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Line_Item__c.Quantity__c</field>
            <operation>greaterOrEqual</operation>
            <value>1</value>
        </criteriaItems>
        <description>populates line item object unit price field with value of merchandise objects price field</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>line Item Updated</fullName>
        <actions>
            <name>update_Stock_Inventory1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Invoice_Statement__c.Status__c</field>
            <operation>equals</operation>
            <value>Open</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
