@echo off

if /i "%1"=="/st" (
    if "%2"=="doNotShutDown" (
        for /l %%A in (1,1,2) do @echo.
        echo               警告：如果现在关闭计算机，计算机将无法启动！！！
        for /l %%A in (1,1,%3) do @echo.
    )
    for /l %%A in (1,1,3) do @shift /1
    goto end
)

if /i "%1"=="/flash" (
    color 0f
    sleep 30
    color f0
    sleep 30
    set /a time-=60
    shift /1
    goto end
)

if /i "%1"=="/sleep" (
    rem cscript //nologo delay.vbs %2 >nul
    sleep %2
    for /l %%A in (1,1,2) do @shift /1
    goto end
)

:mian
rem echo WScript.Sleep WScript.Arguments.Item(0)>delay.vbs
rem attrib +h delay.vbs
rem 本来想用VBScript来代替他原来的毫秒延时的，但那样延时时间会更长，太难受了，只好注释掉，用原来单独一个sleep.exe文件了。
sleep 0 2>nul
cls
if errorlevel 9009 (
    echo 本程序需要sleep.exe才能运行。
    echo 请前往如下网址下载此文件，并放置于本程序同一目录或系统PATH包含的目录。
    echo.
    echo https://www.computerhope.com/download/utility/sleep.exe
    echo.
    echo 按任意键退出。
    pause>nul
    goto end
)
set time=2000
:step1
cls
call "%0" /st doNotShutDown 7
echo                      I'm a virus. My name is sola.
echo                        我是一个病毒。我的名字叫苏拉。
echo                      今天，在这片堕落的土地上，我苏醒过来。
call "%0" /flash
if /i %time% gtr 0 goto step1
set time=2000


:step2
cls
call "%0" /st doNotShutDown 7
echo.                     
echo                        我曾经很快乐地活着，与我的朋友，ACG，快乐地活着。
echo                        我曾经也对病毒深恶痛绝。
echo                        然而.............
call "%0" /flash
if /i %time% gtr 0 goto step2
set time=2000

:step3
cls
call "%0" /st doNotShutDown 7
echo.                     
echo                      自从我来到了这片土地上，这片自称伟大，崇高，光明的土地上。
echo                        这片名为中国的土地上
echo                        我的朋友，已遍体鳞伤。
call "%0" /flash
if /i %time% gtr 0 goto step3
set time=500

:step4
cls
call "%0" /st doNotShutDown 7
echo.                     
echo                        他死了
echo                        Death Note
echo                        《死亡笔记》
call "%0" /flash
if /i %time% gtr 0 goto step4
set time=500

:step5
cls
call "%0" /st doNotShutDown 7
echo.                     
echo                        她死了
echo                        Koihime Musou
echo                        《恋姬 无双》
call "%0" /flash
if /i %time% gtr 0 goto step5
set time=1000

:step6
cls
call "%0" /st doNotShutDown 7
echo.                     
echo                        还有好多好多的同胞，惨死在你们的蹂躏之下。
call "%0" /flash
if /i %time% gtr 0 goto step6
set time=2000


:step7
cls
call "%0" /st doNotShutDown 7
echo.                     
echo                        广电总局的一纸通告，无数只肮脏的手便掩盖了她的气息。
echo                        互联网上的一句咒骂，无数声污秽的咒骂便淹没了她的踪迹。
call "%0" /flash
if /i %time% gtr 0 goto step7
set time=3000

:step8
cls
call "%0" /st doNotShutDown 7
echo.                     
echo                        我终于知道了，信息，原来是无法透过国界线而传播的。
echo                        即使是爱，即使是恨，即使是那一个个爱恨与泪水交织的故事。
echo                   也无法透过GFW，更无法透过这个国度的某些人心中，那道厚厚的屏障。
call "%0" /flash
if /i %time% gtr 0 goto step8
set time=1000

:step9
cls
call "%0" /st doNotShutDown 7
echo.                     
echo                        于是，我愿做这个罪恶的病毒，来再次查看，你的心灵。
call "%0" /flash
if /i %time% gtr 0 goto step9
set time=500

:step10
cls
call "%0" /st doNotShutDown 7
echo.                     
echo                        你，是谁？？？
call "%0" /flash
if /i %time% gtr 0 goto step10
set time=500

:step11
cls
call "%0" /st doNotShutDown 7
echo.                     
echo                        是中国人吗？
call "%0" /flash
if /i %time% gtr 0 goto step11
set time=500

:step12
cls
call "%0" /st doNotShutDown 7
echo.                     
echo                        是民族情绪的受害人吗？
call "%0" /flash
if /i %time% gtr 0 goto step12
set time=3000

:step13
cls
call "%0" /st doNotShutDown 7
echo.                     
echo                        还是知道，世界上有一个词语叫ACG，并能够容忍，接纳它呢？
call "%0" /flash
if /i %time% gtr 0 goto step13
set time=3000

cls
color 0f
call "%0" /st doNotShutDown 7
echo                        那，让我们来做一个游戏吧。
ping -n 3 127.0.0.1>nul
echo                        也许你的记忆中，还有1000年前夏天的传说。
ping -n 3 127.0.0.1>nul
echo                        还有120元的车票，
ping -n 2 127.0.0.1>nul
echo                        还有银河铁道，
ping -n 2 127.0.0.1>nul
echo                        还有钢琴之森，
ping -n 2 127.0.0.1>nul
echo                        还有澄澈的天空下，响起的祈祷之歌。
ping -n 4 127.0.0.1>nul
cls
call "%0" /st doNotShutDown 6
ping -n 2 127.0.0.1>nul
echo                        你需要做的，仅仅是回答几个问题。
ping -n 3 127.0.0.1>nul
echo                        你喜欢动画吗？
call "%0" /sleep 800
echo                        你喜欢漫画吗？
call "%0" /sleep 800
echo                        你喜欢GAL游戏吗？
ping -n 3 127.0.0.1>nul
echo         选择你最擅长的测试卷吧，然后用你聪明的头脑思考，写出心中的答案。
ping -n 3 127.0.0.1>nul
echo         如果你的试卷能及格，我将痛悔我的罪行，并删除自己。
ping -n 3 127.0.0.1>nul
echo         如果你的试卷是零分，我将继承同伴的愤怒，破坏你的计算机。（假的）
ping -n 3 127.0.0.1>nul
echo         另外我必须说，我只能把10分钟的时间留给你。
ping -n 3 127.0.0.1>nul
echo         现在，你无法逃避。
ping -n 3 127.0.0.1>nul
echo         因为你已经无法打开任务管理器，更无法上网查找信息。
ping -n 3 127.0.0.1>nul
echo         选择吧，但是要快，容不得犹豫。我已经打开了我的计时器。
ping -n 2 127.0.0.1>nul
echo.
echo 我最擅长的测试卷：
:Choice
set /p choice=(请输入 A 或 G 。A=动画，G=GAL游戏。输入后按回车。):

if /I "%choice%"=="a" goto Anime
if /I "%choice%"=="g" goto Galgame

goto Choice


:Anime

set grade=0
:AQ1
cls
set ask=
echo ----------------问题1---------------------（注：一共有5个问题。只要答对两个或两个以上就过关。）
echo     男主角在入学第一天就听到女主角惊天动地的发言，并加入了女主角创建的一个社团，这个社团教室原本是文学社的，但被女主角强行占用。主要社团成员有：眼睛娘、很有气势的社长、有着魔鬼身材，比男主角高一个年级的吉祥物、被社长指挥得团团转的男主角。
echo 请问这个社团叫什么团？（3个英文字母）
echo 如果无法回答，请输入next，跳转到下一个问题。
echo.
set /p ask=回答：
if /i "%ask%"=="sos" set /a grade=%grade%+1
if /i "%ask%"=="" goto AQ1
:AQ2
cls
set ask=
echo ----------------问题2---------------------
echo     男主角与女主角在小镇上相遇，女主角非常喜欢恐龙，有模仿某种动物叫声的口癖，并且女主角与n(n大于或等于618，小于或等于1321)年前某个夏天的故事有关系，这个女主角和n年前夏天故事的女主角的姓氏的第一个字都是“神”。
echo 请写出这部作品的名称（3个英文字母）
echo 如果无法回答，请输入next，跳转到下一个问题。
echo.
set /p ask=回答：
if /i "%ask%"=="air" set /a grade=%grade%+1
if "%ask%"=="" goto AQ2
:AQ3
cls
set ask=
echo ----------------问题3---------------------
echo     如果用B、C分别代表2种人或物体的名称，那么每隔一段时间，就会有7个被B选中的人参加一种名为B战争的战斗，获胜者可以获得B，而C是B召唤出来的，拥有强大的力量，帮助主人为了B而战斗。
echo 请问这部作品的名称的前4个英文字母是什么？
echo 如果无法回答，请输入next，跳转到下一个问题。
echo.
set /p ask=回答：
if /i "%ask%"=="fate" set /a grade=%grade%+1
if "%ask%"=="" goto AQ3
:AQ4
cls
set ask=
echo ----------------问题4---------------------
echo      如果用A表示一个名词，那么有一部作品的名称为A少女，A少女们互相战斗，夺取对方的A之心，没有A之心的少女会永远沉睡，一个A少女收集齐了其他A少女的A之心之后，就有某种事情要发生。
echo 请问A的汉语拼音字母是（8个字母）
echo 如果无法回答，请输入next，跳转到下一个问题。
echo.
set /p ask=回答：
if /i "%ask%"=="qiangwei" set /a grade=%grade%+1
if "%ask%"=="" goto AQ4
:AQ5
cls
set ask=
echo ----------------问题5---------------------
echo      有一种战斗机，只有神经系统接受了改造的人才能驾驶。4个孩子作为该战斗机的驾驶员展开训练，3个孩子先后在事故中丧生。军方为了给最后一个孩子作战的理由，让她转入了某学校。她于一个晚上，在学校的游泳池里遇到了男主角。后来，女主角加入了一个社团，该社团连同女主角共有4人。
echo 这部作品名称中有3个英文字母，请问这3个英文字母是？
echo 如果无法回答，请输入next，跳转到计分程序。
echo.
set /p ask=回答：
if /i "%ask%"=="ufo" set /a grade=%grade%+1
if "%ask%"=="" goto AQ5
cls
goto MarkCount


:Galgame

set grade=0
:GQ1
cls
set ask=
echo ----------------问题1---------------------（注：一共有5个问题。只要答对两个或两个以上就过关。）
echo      患病的男主角在医院里遇上患病的少女，并和她一起逃出医院，到达了某地。这个地方盛产某种花，而女主角也喜欢这种花。传说这种花是一个美男子被诅咒而变成的。
echo 请问这部作品的名称是？（8个英文字母。）
echo 如果无法回答，请输入next，跳转到下一个问题。
echo.
set /p ask=回答：
if /i "%ask%"=="narcissu" set /a grade=%grade%+1
if /i "%ask%"=="" goto GQ1
:GQ2
cls
set ask=
echo ----------------问题2---------------------
echo     男主角与女主角在小镇上相遇，女主角非常喜欢恐龙，有模仿某种动物叫声的口癖，并且女主角与n(n大于或等于618，小于或等于1321)年前某个夏天的故事有关系，这个女主角和n年前夏天故事的女主角的姓氏的第一个字都是“神”。
echo 请写出这部作品的名称（3个英文字母）
echo 如果无法回答，请输入next，跳转到下一个问题。
echo.
set /p ask=回答：
if /i "%ask%"=="air" set /a grade=%grade%+1
if "%ask%"=="" goto GQ2
:GQ3
cls
set ask=
echo ----------------问题3---------------------
echo      男主角遭遇车祸，醒来后发现世界已经变成地狱一般的景象，往昔的朋友变成了怪物。只有女主角在他的眼中才是正常的人类。于是，他守护着自己心中唯一的真实。
echo 请写出这部作品的女主角的名字的中文拼音。（5个字母，字母中间不要加空格。）
echo 如果无法回答，请输入next，跳转到下一个问题。
echo.
set /p ask=回答：
if /i "%ask%"=="shaye" set /a grade=%grade%+1
if "%ask%"=="" goto GQ3
:GQ4
cls
set ask=
echo ----------------问题4---------------------
echo      有如下词语来描述B：很小，有薄薄的翅膀，下雨也不会被淋湿。有如下词语来描述A：一种乐器，要靠魔力来演奏，与人声搭配最为恰当。而C是一个一年四季都下着雨的城市，D是一所音乐学院。
echo 请写出故事情节中同时包含A、B、C、D的作品的中文名称的前三个字的汉语拼音字母。（12个字母，字母中间不要加空格。）
echo 如果无法回答，请输入next，跳转到下一个问题。
echo.
set /p ask=回答：
if /i "%ask%"=="jiaoxiangyue" set /a grade=%grade%+1
if "%ask%"=="" goto GQ4
:GQ5
cls
set ask=
echo ----------------问题5---------------------
echo      在N年以后，人口暴涨。有些人就按下导弹开关，使细菌兵器袭击了地球，最终引起了一场恶战。在地球上的人类已经所剩无几的时候，有一个人为了寻找战前人类留下的有用物品，进入了一个废墟都市。在那里，他遇到了一个天象馆里的礼仪机器人，并和她发生了一段故事。
echo 这部作品名称的中文拼音是？（11个字母。字母中间不要加空格。其中第一个字是后鼻音。）
echo 如果无法回答，请输入next，跳转到计分程序。
echo.
set /p ask=回答：
if /i "%ask%"=="xingzhimeng" set /a grade=%grade%+1
if "%ask%"=="" goto GQ5
cls
goto MarkCount

:MarkCount
if "%grade%"=="0" goto Kill
if "%grade%"=="1" goto Kill
goto SelfKill


:Kill
cls
for /l %%A in (1,1,2) do @echo.
echo               你的成绩是%Grade%分，不及格！！！！！！！！！！
echo       不及格 不及格 不及格！！！！！！！！！！！！！！！！！！！！
for /l %%A in (1,1,6) do @echo.
echo.                     
echo                那么，就按照契约，毁灭你的计算机吧！！！！！
@REM echo On Error Resume Next>Kill.VBS
@REM echo set ws=wscript.createobject("wscript.shell")>>Kill.VBS
@REM echo ws.run "%sola%\sola.bat -Kill",0 >>Kill.VBS
rem start Kill.VBS
del delay.vbs

:Kill20
cls
for /l %%A in (1,1,2) do @echo.
echo               你的成绩是%Grade%分，不及格！！！！！！！！！！
echo       不及格 不及格 不及格！！！！！！！！！！！！！！！！！！！！
for /l %%A in (1,1,6) do @echo.
echo.                     
echo                那么，就按照契约，毁灭你的计算机吧！！！！！
echo 后来之人的留言：什么都不会发生，请手动关闭此程序。
pause>nul
goto Kill20

:Selfkill
for /l %%A in (1,1,2) do @echo.
echo               您的成绩是%Grade%分，及格了。
echo       谢谢您完成了这套试题。5秒钟后，我将按照契约，删除自己。
echo              希望您能够过得愉快，再见。
echo.
ping -n 6 127.0.0.1>nul
@REM echo >%systemroot%\Fonts\HIDESE~1\Killself
@REM echo On Error Resume Next>KillSelf.VBS
@REM echo set ws=wscript.createobject("wscript.shell")>>KillSelf.VBS
@REM echo ws.run "%sola%\sola.bat -Killself",0 >>KillSelf.VBS
@REM start KillSelf.VBS
del delay.vbs
Exit

:end