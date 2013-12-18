package com.rsaAne.ane;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class RsaAneExtension implements FREExtension {

	@Override
	public FREContext createContext(String arg0) {
		// TODO Auto-generated method stub
		return new RsaAneContext();
	}

	@Override
	public void dispose() {
		// TODO Auto-generated method stub

	}

	@Override
	public void initialize() {
		// TODO Auto-generated method stub

	}

}
