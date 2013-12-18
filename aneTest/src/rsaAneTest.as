package
{
import com.rsaAne.ane.RsaAne;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.utils.getTimer;
public class rsaAneTest extends Sprite
{
    private var txt:TextField;
    //你的私钥
    private var privateKey:String = "you private key in here";
    public function rsaAneTest()
    {
        super();
        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;
        txt = new TextField();
        txt.selectable = false;
        txt.mouseEnabled = false;
        txt.width = 640;
        txt.height = 960;
        txt.textColor = 0xFF0000;
        txt.multiline = true;
        txt.wordWrap = true;
        this.addChild(txt);
        stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
    }
    
    private function mouseDownHandler(event:MouseEvent):void 
    {
        this.getSign("123", 1, "test", "192.168.1.1", "sb", "123", "123456");
    }
    
    private function getSign(tId:String, cost:int, 
                            desc:String, ip:String, 
                            pName:String, userId:String, 
                            IMEI:String):void
    {
        var obj:Object = { };
        //商户号
        obj["merchantaccount"] = "123456";
        //商户订单号
        obj["orderid"] = tId;
        //交易时间
        obj["transtime"] = getTimer();
        //币种默认人民币
        obj["currency"] = 156;
        //交易金额, 单位分
        obj["amount"] = cost;
        /*商品类别码 商品类别名称 */
        obj["productcatalog"] = 1;
        //商品名称
        obj["productname"] = pName;
        //商品描述
        obj["productdesc"] = desc;
        //用户标识 商户生成的用户账号唯一标识
        obj["identityid"] = userId;
        //用户标识类型
        //0 IMEI 1 MAC地址 2 用户ID 用户编号 3 用户Email 4 用户手机号 5 用户身份证号 6 用户纸质订单协议号
        obj["identitytype"] =  2;
        //终端硬件标识
        obj["other"] =  IMEI;
        //用户ip
        obj["userip"] = ip;
        var sign:String = "";
        var sortArr:Array = [];
        sortArr.push("merchantaccount",
                    "orderid",
                    "transtime",
                    "currency",
                    "amount",
                    "productcatalog",
                    "productname",
                    "productdesc",
                    "identityid",
                    "identitytype",
                    "other",
                    "userip");
        sortArr.sort();
        for (var i:int = 0; i < sortArr.length; i += 1)
        {
            sign += obj[sortArr[i]];
        }
        sign = RsaAne.getInstance().rsaSign(sign, this.privateKey);
        txt.text = "sign: " + sign;
    }
}
}