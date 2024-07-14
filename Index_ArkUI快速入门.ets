import defaultAppManager from '@ohos.bundle.defaultAppManager'
import continuationManager from '@ohos.continuation.continuationManager'
@Entry
@Component
struct Index {
  @State message: string = 'Hello 山狗学会！'
  @State progress_value: number = 0

  private video_controller:VideoController | undefined;
  //使用资源访问符$rawfile()引用视频资源。
  private video_innerResource: Resource = $rawfile('Love.mp4');

  //创建构造器，与装饰器呼应相连。
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialog_Shangou(),
  })

  build() {

    Row() {
      Column({ space: 20 }) {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Divider()

        Row(){
          Video({
            src: this.video_innerResource,
            controller: this.video_controller
          })
            .width('100%')
            .height(300)
            .controls(true)
        }

        //点击与onClick事件绑定的组件使弹窗弹出。
        Row(){
          Button('邀请函')
            .onClick(() => {
              this.dialogController.open()
            })
        }

        Row(){
          Image($rawfile('19.png'))
            .width('50%')
            .margin({left:10})
          Image($rawfile('19.png'))
            .width('40%')
            .colorFilter(
              [1, 1, 0, 0, 0,
              0, 1, 0, 0, 0,
              0, 0, 1, 0, 0,
              0, 0, 0, 1, 0])
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)

        Row(){
          TextInput({placeholder: '请输入你的名字：'})
            .height(50)
            .padding({left:10})
            .fontSize(16)
            .textAlign(TextAlign.Start)
            .backgroundColor(0xEEEEEE)
        }
        Row(){

          TextArea({placeholder:"请输入你的感想："})
            .height(200)
        }

        Progress({value:0, total:100, type:ProgressType.Capsule})
          .width(200)
          .height(60)
          .value(this.progress_value)
        // Row().width('100%').height(0)
        Button('进度+10')
          .onClick(()=>{
            this.progress_value += 5
            if(this.progress_value > 100){
              this.progress_value = 0
            }
          })


        Button('Click Me')
          .onClick(()=>{this.message = "Hello ArkUI!"})
          .height(50)
          .width(100)
        Row().width('90%').height(50).backgroundColor(0xF5DEB3)
        Row().width('90%').height(50).backgroundColor(0xD2B48C)
        Row().width('90%').height(50).backgroundColor(0xF5DEB3)
        Row() {
          Column() {
            Radio({ value: 'Color1', group: 'ColorRadioGroup' })
              .height(60)
              .width(60)
              .onChange((isChecked: boolean) => {
                if (isChecked) {
                  this.message = "Hello Color1!"
                }
              })
            Text('Color1')
          }
          Column() {
            Radio({ value: 'Color2', group: 'ColorRadioGroup' })
              .height(30)
              .width(30)
              .onChange((isChecked: boolean) => {
                if (isChecked) {
                  this.message = "Hello Color2!"
                }
              })
            Text('Color2')
          }
        }
        Row(){
          Text("是否接受祝福？")
            .height(50)
            .padding({left:10})
            .fontSize(16)
            .textAlign(TextAlign.Start)
            .backgroundColor(0xEEEEEE)
          Toggle({type: ToggleType.Switch})
            .margin({left:100, right:10})
            .onChange((isOn: Boolean)=>{
              if(isOn){
                this.message = "你接受了祝福，成为富翁的运气已经增肌2成!"
              }
              else{
                this.message = "你拒绝了祝福，成为富翁的运气保持不变!"
              }
            })
        }
        .backgroundColor(0xAAAAAA)
      }
      .width('100%')
    }
    .height('100%')
  }
}

//使用@CustomDialog装饰器装饰自定义弹窗。
// @CustomDialog装饰器用于装饰自定义弹框，此装饰器内进行自定义内容（也就是弹框内容）。
@CustomDialog
struct CustomDialog_Shangou {
  controller: CustomDialogController = new CustomDialogController({
    builder: CustomDialog_Shangou({}),
  })

  build() {
    Column() {
      Text('加入山狗学会吧！')
        .fontSize(30)
        .margin({ top: 10, bottom: 10 })
    }
  }
}

