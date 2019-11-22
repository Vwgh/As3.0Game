package  {
    import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.events.MouseEvent;
	
	public class PaintTest extends Sprite {
		private var innerRect:Sprite=new Sprite();
		
		public function PaintTest() {
			graphics.lineStyle(3,0x000000,1);
			stage.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
			stage.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
			//给自由绘画部分加上边框（参考教材P62）
			innerRect.graphics.lineStyle(3,0x000000,1);
			innerRect.graphics.drawRect(180,10,330,300);
			innerRect.graphics.endFill();
			innerRect.addEventListener(MouseEvent.MOUSE_DOWN,innerRectmouseDownHandler);
			innerRect.addEventListener(MouseEvent.MOUSE_UP,innerRectmouseUpHandler);
		    addChild(innerRect);
			//添加一个清除的功能
			delBtn.addEventListener(MouseEvent.CLICK,clearPainting);
			addChild(delBtn);
			//进行固定形状的绘制
			lineBtn.addEventListener(MouseEvent.CLICK,lineInfo);
			rectBtn.addEventListener(MouseEvent.CLICK,rectInfo);
			roundBtn.addEventListener(MouseEvent.CLICK,circleInfo);
			//通过点击色块按钮改变笔触的颜色
			Red.addEventListener(MouseEvent.CLICK,redPainting);
		    Green.addEventListener(MouseEvent.CLICK, greenPainting);
			Blue.addEventListener(MouseEvent.CLICK,bluePainting);
			Yellow.addEventListener(MouseEvent.CLICK,yellowPainting);
		}
		
		//在框内自由绘画
		public function mouseDownHandler(event:MouseEvent){
			graphics.moveTo(event.stageX,event.stageY);
			stage.addEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler);
			}
		public function mouseMoveHandler(event:MouseEvent){
			graphics.lineTo(event.stageX,event.stageY);
			}
		public function mouseUpHandler(event:MouseEvent){
			stage.removeEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler);
			}
		public function innerRectmouseDownHandler (event:MouseEvent){
			innerRect.graphics.moveTo(event.localX,event.localY);
			innerRect.addEventListener(MouseEvent.MOUSE_MOVE,innerRectmouseMoveHandler);
			}
		public function	innerRectmouseMoveHandler (event:MouseEvent){
			innerRect.graphics.lineTo(event.localX,event.localY);
			}
		public function	innerRectmouseUpHandler (event:MouseEvent){
			innerRect.removeEventListener(MouseEvent.MOUSE_MOVE,innerRectmouseMoveHandler);
			}
		
		//类型二：
		public function redPainting(eve:MouseEvent){
			trace("点击了红色按钮");
			graphics.lineStyle(3,0xFF0000,1);
		}
		public function bluePainting(eve:MouseEvent){
			trace("点击了蓝色按钮");
			graphics.lineStyle(3,0x0000FF,1);
		}
		public function greenPainting(eve:MouseEvent){
			trace("点击了绿色按钮");
			graphics.lineStyle(3,0x00FF00,1);
		}
		public function yellowPainting(eve:MouseEvent){
			trace("点击了黄色按钮");
			graphics.lineStyle(3,0xFFFF00,1);
		}
				
		//类型三：形状绘画（点击形状按钮后）		
		public function lineInfo(e:MouseEvent):void {
			var lineer=new Sprite();
			addChild(innerRect);
			lineer.x =  550; 
	        lineer.y = 400;
			graphics.lineStyle(5,0x000000);
			graphics.moveTo(200,200);
			graphics.lineTo(260,200);
		}
		public function rectInfo (e:MouseEvent){
			var recter=new Sprite();
			addChild(innerRect);
			graphics.lineStyle(5,0x000000);
		    graphics.drawRect(260,60,60,40);
			}
	  public function circleInfo (e:MouseEvent){
			var circleer=new Sprite();
			addChild(innerRect);
		    graphics.lineStyle(3,0x000000);
		    graphics.drawCircle(340,160,40);
			}
	public function clearPainting(eve:MouseEvent){
		graphics.clear();
	      }
}
}
