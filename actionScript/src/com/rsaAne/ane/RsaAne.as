package com.rsaAne.ane 
{
import flash.events.EventDispatcher;
import flash.events.StatusEvent;
import flash.external.ExtensionContext;
/**
 * ...用于rsa签名的ANE
 * @author Kanon
 */
public class RsaAne extends EventDispatcher 
{
	//与extension.xml中的id标签一致
	public static const EXTENSION_ID:String = "com.rsaAne.ane";
	//获取RSA签名
	public static const SIGN:String = "sign";
	//用于连接静态库的上下文 
	private var context:ExtensionContext;
	private static var instance:RsaAne;
	public function RsaAne(singletoner:Singletoner) 
	{
		if (!singletoner) throw new Error("非法初始化单例元件");
		this.initContext();
	}
	
	/**
	 * 获取单例
	 * @return
	 */
	public static function getInstance():RsaAne
	{
		if (!instance) instance = new RsaAne(new Singletoner());
		return instance;
	}
	
	/**
	 * 初始化上下文
	 */
	private function initContext():void
	{
		if (!this.context)
		{
			this.context = ExtensionContext.createExtensionContext(RsaAne.EXTENSION_ID, "");
			this.context.addEventListener(StatusEvent.STATUS, statusHandler);
		}
	}
	
	/**
	 * 转抛事件 由游戏内部监听
	 * @param event 回调事件
	 */
	private function statusHandler(event:StatusEvent):void
	{
		this.dispatchEvent(event);
	}
    
    /**
     * 获取rsa签名
     * @param	content         字符串内容
     * @param	privateStr      私钥
     * @return  签名
     */
    public function rsaSign(content:String, privateStr:String):String
    {
        if (this.context)
            return this.context.call(RsaAne.SIGN, content, privateStr) as String;
        return "get rsa sign fail";
    }
}
}
class Singletoner {
}