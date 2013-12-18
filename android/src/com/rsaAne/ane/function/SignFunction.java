package com.rsaAne.ane.function;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.rsaAne.ane.utils.LogUtil;
import com.util.encrypt.RSA;

public class SignFunction implements FREFunction {

	@Override
	public FREObject call(FREContext context, FREObject[] args) {
		FREObject object = null;
		String content = "";
		String privateKey = "";
		String sign;
		try{
			content = args[0].getAsString();
			privateKey = args[1].getAsString();
			sign = RSA.sign(content, privateKey);
			object = FREObject.newObject(sign);
		} catch (Exception e) {
			LogUtil.log("exception " + e.getMessage());
			e.printStackTrace();
		}
		return object;
	}

}
