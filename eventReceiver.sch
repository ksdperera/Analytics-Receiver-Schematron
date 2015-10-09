<?xml version="1.0" encoding="UTF-8"?>


<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt">

  <sch:title>Analytics Receiver Artifact Validation</sch:title>

  <sch:p>

    This schema provides  assertions and reports to validate
    receiver artifact xml doc.

  </sch:p>
  
  <sch:ns prefix="rs" uri="http://wso2.org/carbon/eventreceiver" />

  <sch:ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema" /> 
  
   <sch:pattern id="Check From">
    <sch:title>Checks the From is correct</sch:title>
    
    <sch:rule context="rs:from[@eventAdapterType='email']">
      <sch:assert test="count(rs:property) = count(rs:property[@name='transport.PollInterval']) +
      										 count(rs:property[@name='mail.protocol.host']) +
      										 count(rs:property[@name='mail.protocol.password']) +
      										 count(rs:property[@name='mail.protocol.port']) +
      										 count(rs:property[@name='mail.protocol.user']) +
      										 count(rs:property[@name='transport.mail.Address']) +
      										 count(rs:property[@name='transport.mail.Protocol']) +
      										 count(rs:property[@name='transport.PollInterval'])">
        Invalid Property Value Exist !
      </sch:assert>
    </sch:rule>
    
    <sch:rule context="rs:from[@eventAdapterType='file-tail']">
      <sch:assert test="count(rs:property) = count(rs:property[@name='filepath']) +
      										 count(rs:property[@name='delayInMillis']) +
      										 count(rs:property[@name='startFromEnd'])">
        Invalid Property Value Exist !
      </sch:assert>
    </sch:rule>
    
    <sch:rule context="rs:from[@eventAdapterType='http']">
      <sch:assert test="count(rs:property) = count(rs:property[@name='transports'])">
        Invalid Property Value Exist !
      </sch:assert>
    </sch:rule>
    
    <sch:rule context="rs:from[@eventAdapterType='jms']">
      <sch:assert test="count(rs:property) = count(rs:property[@name='java.naming.factory.initial']) +
      										 count(rs:property[@name='jms.properties']) +
      										 count(rs:property[@name='transport.jms.UserName']) +
      										 count(rs:property[@name='java.naming.provider.url']) +
      										 count(rs:property[@name='transport.jms.Password']) +
      										 count(rs:property[@name='transport.jms.DestinationType']) +
      										 count(rs:property[@name='transport.jms.SubscriptionDurable']) +
      										 count(rs:property[@name='transport.jms.Destination']) +
      										 count(rs:property[@name='transport.jms.DurableSubscriberName']) +
      										 count(rs:property[@name='transport.jms.ConnectionFactoryJNDIName']) ">
        Invalid Property Value Exist !
      </sch:assert>
    </sch:rule>
    
    <sch:rule context="rs:from[@eventAdapterType='kafka']">
      <sch:assert test="count(rs:property) = count(rs:property[@name='topic']) +
      										 count(rs:property[@name='zookeeper.connect']) +
      										 count(rs:property[@name='threads']) +
      										 count(rs:property[@name='group.id']) +
      										 count(rs:property[@name='events.duplicated.in.cluster']) +
      										 count(rs:property[@name='optional.configuration'])">
        Invalid Property Value Exist !
      </sch:assert>
    </sch:rule>
    
    <sch:rule context="rs:from[@eventAdapterType='mqqt']">
      <sch:assert test="count(rs:property) = count(rs:property[@name='topic']) +
      										 count(rs:property[@name='url']) +
      										 count(rs:property[@name='username']) +
      										 count(rs:property[@name='password']) +
      										 count(rs:property[@name='clientId']) +
      										 count(rs:property[@name='cleanSession'])">
        Invalid Property Value Exist !
      </sch:assert>
    </sch:rule>
    
    <sch:rule context="rs:from[@eventAdapterType='soap']">
      <sch:assert test="count(rs:property) = count(rs:property[@name='transports'])">
        Invalid Property Value Exist !
      </sch:assert>
    </sch:rule>
    
    <sch:rule context="rs:from[@eventAdapterType='websocket']">
      <sch:assert test="count(rs:property) = count(rs:property[@name='websocket.server.url']) +
      										 count(rs:property[@name='events.duplicated.in.cluster'])">
        Invalid Property Value Exist !
      </sch:assert>
    </sch:rule>    
    
    <sch:rule context="rs:from[@eventAdapterType='websocket-local']">
      <sch:assert test="count(rs:property) = 0">
        Invalid Property Value Exist !
      </sch:assert>
    </sch:rule>
    
    <sch:rule context="rs:from[@eventAdapterType='wso2event']">
      <sch:assert test="count(rs:property) = count(rs:property[@name='events.duplicated.in.cluster'])">
        Invalid Property Value Exist !
      </sch:assert>
    </sch:rule>
    
  </sch:pattern>
  
</sch:schema>