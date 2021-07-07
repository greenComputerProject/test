package com.green.jms;

import javax.jms.JMSException;
import javax.jms.MapMessage;
import javax.jms.Message;
import javax.jms.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jms.support.converter.MessageConversionException;
import org.springframework.jms.support.converter.MessageConverter;
import org.springframework.stereotype.Component;

import com.green.jms.domain.MessageDto;

@Component
public class MessageConverterImpl implements MessageConverter{
	
	private Logger logger = LoggerFactory.getLogger(this.getClass().getName());
	private String TAG = this.getClass().getName();

	@Override
	public Message toMessage(Object object, Session session) throws JMSException, MessageConversionException {
		// TODO Auto-generated method stub
		logger.debug("> toMessage", TAG);
	
		if( !(object instanceof MessageDto)) {
			throw new MessageConversionException("not NotificationDto");
		}
		MessageDto dto = new MessageDto();
		
		
		MapMessage mapMessage = session.createMapMessage();
		mapMessage.setString("from", dto.getFrom());
		mapMessage.setString("to", dto.getTo());
		mapMessage.setString("content", dto.getContent());
		
		return mapMessage;
	}

	@Override
	public Object fromMessage(Message message) throws JMSException, MessageConversionException {
		// TODO Auto-generated method stub
		logger.debug("> fromMessage", TAG);
		
		if(!(message instanceof MapMessage)) {
			throw new MessageConversionException("not MapMessage");
		}
		
		MapMessage mapMessage = (MapMessage)message;
		
		MessageDto dto = new MessageDto();
		dto.setFrom(mapMessage.getString("from"));
		dto.setTo(mapMessage.getString("to"));
		dto.setContent(mapMessage.getString("content"));
		
		return dto;
	}

}
