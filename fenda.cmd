@echo off
title �����������ͷ��ר�������ġ�
:NPC.0
cls
echo ��̨�����������ͷ��ר�������ġ�����������ԭ�أ���������Ͽ������ƺ��������ķ��ר����ûʲô��ͬ��
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo ��ֱ�������㣬��̨���������򵥡�
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo.
echo �X�T�T�T�T�T�T�T�T�h�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�[
echo �U  [1]   ��   ʹ�û�����      �U
echo �U  [2]   ��   ����������      �U
echo �U  [3]   ��   ���ƻ�����      �U
echo �U  [4]   ��   Ź�������      �U
echo �U  [5]   ��   ��ο������      �U
echo �U  [6]   ��   ��ò��ȥ��      �U
echo �^�T�T�T�T�T�T�T�T�k�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�a
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
echo ���ճ���ʹ����̨������ҪͶ��������һƿ��ｨ�����ۼ۵�ֵ��Ħ���������������Ҳ������㡣
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo ����Ͼ����ڡ����ж��졹֮�У����հ�Բ��˵������̨�����������ԭ�϶���Դ�ڶ���������
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo ���ԣ���������ʹ����̨�����ר��������
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo.
echo �X�T�T�T�T�T�T�T�T�h�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�[
echo �U  [1]   ��   ������     �U
echo �U  [2]   ��   �������ˡ�      �U
echo �^�T�T�T�T�T�T�T�T�k�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�a
echo.
choice /c 12
if errorlevel 2 goto give_up
if errorlevel 1 goto drink


:drink
cls
echo �����������ײ��������Һ����������ٻ�ϰ���������������һ����ͬ�����ĺ�����
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo ����ʱ��һƿ�����䡤���ͳ�������ר�����ĳ����ڡ�
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo ��һ�ں���ƿ�еķ�ȷʵ���ܵ��˷����е���ζ�����ж��ݵ�����У����ƺ������ﲻ̫�ԡ�
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo �Ͱ�Բ���ĳ��ݵĲ�����ͬ�����Ļ�ζ�ܿ����ʧ�ˡ�
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo �ǻ����е�ԭ�϶�������ģ����ɵ�Ե���𣿸о��������ʲô���ֺ���ʲô��û�ȡ�
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo ���������Բ����ƿ���ԭƷ������ϸϸƷ��һ���������Ʒ���������ö���������ԭ����ζ�����ڵķ���ˡ�
echo. & ping -n 4 127.0.0.1>nul 2>nul
goto end

:give_up
cls
echo ��������һ�������ĺ��������������㡸�ⶼ���̣���
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo ������Ҳ�������Լ���������ֱ�Ӵ�һƿ��ｫ������������
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo ���Բ��ú󣬻�����ֹͣ���궯�������˱��˵ĳ�Ĭ��
echo. & ping -n 4 127.0.0.1>nul 2>nul
goto end

:NPC.1.2
echo �㽫�����������ڷ��ר�����ԣ�ֻ����һ�������ת�ĺ��������ƺ������ﲻ�Ծ���
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo ��ϸ�ֱ���ܷ��֣����е������ƺ�����ĳЩ���������Բ���г��������ϵ͵�����������ɵġ�
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo ��֪���ǰ�ԲΪ���ڸ���̨���������������������������˲������ֵĻ��أ�������ֻ��ط����˹��ϡ�
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo ����˵����̨����ԭ���Ͳ�������ת��������
echo. & ping -n 4 127.0.0.1>nul 2>nul
goto end

:NPC.1.3
echo ��̨�����ר��������û�����������ơ�
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo ��Ϊ��ֻ��һ̨�����ר��������û�м�װ��������������ʶ��װ�ã�û�п��������������������ġ��۾�����
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo ��Ȼ����Ҳû������˼���ġ��Դ��������㿴����������ƣ�Ҳ����������
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo �������룬Ҫ�������С��۾��������С��Դ�����˵�������ĳЩ���˱��кøУ�����Ϊ��Щ���˴��ۡ�
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo ��������������ȫû�����壬��̨������������������ṩ��Ʒ��
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo ��һ��̨���ˡ��۾����͡��Դ����Ļ������˳�ȥ�����·�����磬�á����ж��족�Ķ�����������������Ʒ��
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo ��ζ��Ʒ��ĳЩ����Ľ����к������⣬���Ұ��²���������Щ����Ϊ������������ִ�����㹻����ͷ���ˡ�
echo. & ping -n 4 127.0.0.1>nul 2>nul
echo ���Դ�����Ƕȿ��ǣ���̨����û�����������ƣ�Ҳδ������һ�����¡�
echo. & ping -n 4 127.0.0.1>nul 2>nul
goto end

:NPC.1.4


:NPC.1.5


:NPC.1.6

@rem iexplore -e https://www.bilibili.com/video/BV1KH4y1f7yu
:end
echo =============END=============

echo ��������˳��� & pause>nul