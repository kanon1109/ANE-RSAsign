package com.rsaAne.ane;

import java.util.HashMap;
import java.util.Map;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.rsaAne.ane.function.SignFunction;

public class RsaAneContext extends FREContext 
{
	public static final String SIGN = "sign";
	@Override
	public void dispose() {
		// TODO Auto-generated method stub

	}

	@Override
	public Map<String, FREFunction> getFunctions() {
		// TODO Auto-generated method stub
		Map<String, FREFunction> map = new HashMap<String, FREFunction>();
		//”≥…‰
	    map.put(SIGN, new SignFunction());
		return map;
	}

}
