package com.green.jms;

import javax.jms.JMSException;
import javax.jms.MapMessage;
import javax.jms.Message;
import javax.jms.MessageListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MessageListenerImpl implements MessageListener{

	private Logger logger = LoggerFactory.getLogger(this.getClass().getName());
	
	@Override
	public void onMessage(Message message) {
		// TODO Auto-generated method stub
		if(!(message instanceof MapMessage)) {
			
			try {
				
				
				logger.debug(((MapMessage) message).getString("content"));
			} catch (JMSException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			throw new IllegalArgumentException("메시지는 Map여야합니다");
		}
	}

}
