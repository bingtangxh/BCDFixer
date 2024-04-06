@echo off
title 「机动自律型枫达专卖机·改」
:NPC.0
cls
echo 这台「机动自律型枫达专卖机·改」安静伫立在原地，单从外观上看，它似乎与其他的枫达专卖机没什么不同。
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo 但直觉告诉你，这台机器并不简单…
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo.
echo ╔════════╤══════════════════╗
echo ║  [1]   │   使用机器…      ║
echo ║  [2]   │   聆听机器…      ║
echo ║  [3]   │   挑衅机器…      ║
echo ║  [4]   │   殴打机器…      ║
echo ║  [5]   │   安慰机器…      ║
echo ║  [6]   │   礼貌离去…      ║
echo ╚════════╧══════════════════╝
echo.
choice /c 123456
if errorlevel 6 goto NPC.1.6
if errorlevel 5 goto NPC.1.5
if errorlevel 4 goto NPC.1.4
if errorlevel 3 goto NPC.1.3
if errorlevel 2 goto NPC.1.2
if errorlevel 1 goto NPC.1.1

:NPC.1.1
cls
echo 按照常理，使用这台机器需要投入至少与一瓶枫达建议零售价等值的摩拉才能运作，并且不会找零。
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo 但这毕竟是在「壶中洞天」之中，按照阿圆的说法，这台机器制造枫达的原料都来源于洞天仙力。
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo 所以，你可以免费使用这台「枫达专卖机」…
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo.
echo ╔════════╤══════════════════╗
echo ║  [1]   │   畅饮枫达！     ║
echo ║  [2]   │   还是算了…      ║
echo ╚════════╧══════════════════╝
echo.
choice /c 12
if errorlevel 2 goto give_up
if errorlevel 1 goto drink


:drink
cls
echo 齿轮与基件碰撞，伴随着液体与气体高速混合般的震颤，机器发出一阵如同欢呼的轰鸣。
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo 不多时，一瓶「经典·枫达」就出现在了专卖机的出货口。
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo 你一口喝完瓶中的枫达，确实感受到了枫达独有的甜味，还有短暂的满足感，但似乎有哪里不太对。
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo 和阿圆精心冲泡的茶饮不同，枫达的回味很快就消失了。
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo 是机器中的原料都由仙力模拟而成的缘故吗？感觉好像喝了什么，又好像什么都没喝…
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo 或许，多给阿圆带几瓶枫达原品，让她细细品尝一番异国的饮品，她就能用洞天仙力还原出口味更正宗的枫达了。
echo. & ping -n 4 127.0.0.1>nul 2>nul
goto end

:give_up
cls
echo 机器发出一阵唏嘘般的轰鸣，像是在问你「这都能忍？」
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo 但机器也不可能自己跳起来，直接打开一瓶枫达将它塞进你的嘴里。
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo 所以不久后，机器便停止了躁动，陷入了悲伤的沉默。
echo. & ping -n 4 127.0.0.1>nul 2>nul
goto end

:NPC.1.2
echo 你将耳朵轻轻贴在枫达专卖机旁，只听见一阵机关运转的轰鸣，但似乎有哪里不对劲…
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo 仔细分辨就能发现，其中的噪声似乎都是某些璃月乐器以不和谐的曲调与较低的音调演奏而成的。
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo 不知道是阿圆为了掩盖这台机器的噪音，特意在其中设置了播放音乐的机关，结果音乐机关发生了故障…
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo 还是说，这台机器原本就不存在运转的噪音？
echo. & ping -n 4 127.0.0.1>nul 2>nul
goto end

:NPC.1.3
echo 这台“枫达专卖机”并没有理会你的挑衅。
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo 因为它只是一台“枫达专卖机”，没有加装警卫机关那样的识别装置，没有看见自身所处的这个世界的“眼睛”。
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo 当然，它也没有用来思考的“脑袋”。就算看见了你的挑衅，也不会生气。
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo 反过来想，要是它既有“眼睛”，又有“脑袋”，说不定会对某些客人抱有好感，进而为这些客人打折。
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo 但打折在这里完全没有意义，这台机器有义务向你免费提供饮品。
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo 万一这台有了“眼睛”和“脑袋”的机器溜了出去，导致枫达外溢，让“壶中洞天”的动物们迷上了这种饮品…
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo 甜味饮品对某些动物的健康有害的问题，暂且按下不表…但是这些动物为争夺枫达而起的争执，就足够让人头疼了。
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo 所以从这个角度考虑，这台机器没有理会你的挑衅，也未尝不是一件好事…
echo. & ping -n 4 127.0.0.1>nul 2>nul
goto end

:NPC.1.4


:NPC.1.5


:NPC.1.6

@rem iexplore -e https://www.bilibili.com/video/BV1KH4y1f7yu
:end
echo =============END=============

echo 按任意键退出。 & pause>nul