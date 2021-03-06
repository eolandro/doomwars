Doom Wars: UAC vs. Hell v.1.3 beta1 by cybermind

Дата выпуска: 17/03/2014

=== ИНФОРМАЦИЯ ===
Вы скачали новую версию Doom Wars: UAC vs. Hell - стратегию в реальном времени во вселенной игры Doom, основанной на движке Stratagus.
С момента выпуска последней версии в 2010 накопилось очень много изменений. Вы увидите новый геймплей, новые юниты и много чего еще.
Данная версия является тестовой, в ней могут быть досадные ошибки. Подробнее см. раздел ТЕСТИРОВАНИЕ.

=== СИСТЕМНЫЕ ТРЕБОВАНИЯ ===
ОС: Windows 98 SE и выше, Linux, основанные на Linux Maemo устройства, Mac OS X, BSD
ЦП: 750+ МГц процессор
ОЗУ: 256 МБайт
Видеокарта: поддерживающая как минимум 32-битный 640x480 режим (OpenGL режим требует как минимум 32 МБайт видеопамяти)
Звук: SDL-совместимая звуковая карта

stratagus.exe, который идет вместе с игрой, был скомпилирован с использованием MSVC 2008 и требует для работы Microsoft Visual C++ 2008 Redistributable Package (скачайте его на сайте Microsoft). Для поддержки других операционных систем, скачайте последнюю ревизию исходников Stratagus (на Launchpad, ссылка внизу) и скомпилируйте их для своей машины.

=== ИЗМЕНЕНИЯ ===
Здесь перечислены наиболее значительные изменения в Doom Wars:
- Поддержка новой версии движка Stratagus, которая включает в себя много новых функций и исправлений ошибок (OpenGL режим, поддержка современных ОС Windows и многих других)
- Сеть и реплеи игр снова функционируют.
- Много новых юнитов, в то время как несколько старых были удалены из игры(в основном со спрайтами из других). По крайней мере у UAC теперь новый парк техники.
- Все постройки были переделаны.
- Новый режим - Doom Wars DeathMatch, переносящий оригинальный deathmatch из Doom в реалии Doom Wars.
- 2 новых тайлсета - Земля и Ад, в то время как остальные тайлсеты были серьезно модифицированы(особенно это касается тайлсетов внутри зданий)
- Игра поддерживает много новых оконных разрешений, вплоть до 1920x1080
- Рабочий редактор карт
- Новый геймплей - расы имеют больше различий, каждый юнит обладает своими достоинствами и недостатками. Адские юниты способны использовать пехоту в качестве зомби, тогда как UAC способна изучать аномалии Ада в своих целях. Множество новых технологий, старые же были переделаны. 
- Система ветеранства - юниты получают опыт и ранги, становясь сильнее и обретая новые способности.
- Более эффективный ИИ: 5 уровней сложности, названные как уровни сложности из оригинального Doom; каждый юнит пытается атаковать наиболее уязвимые цели. ИИ использует почти все возможности игры, включая супероружия.
- Улучшенный интерфейс: возможность предпросмотра изображения карты при настройке игры, быстрые кнопки на левой стороне игрового интерфейса, режим полной карты(без боковой панели), всплывающие окна на кнопках и т.д.
- Новая экономическая система - минералы и энергия. Минералы добываются из восстанавливающихся месторождений и энергия собирается из генераторов.
- Система брони - броня защищает пехоту UAC от части повреждений, но и сама разрушается со временем.
- Большинство юнитов ведут себя как в оригинальном Doom - например, Архиподлецы поджигают непосредственно цель и способны воскрешать мертввых демонов.
- Почти вся озвучка была перезаписана(включая озвучку раздражения юнитов!)
- Улучшенные анимации и новая система частиц, используемая для эффектов.
- Документация по игре(пока только на английском языке)
- Поддержка русского языка в игре
... и много чего еще :)

=== ТЕКУЩИЙ СТАТУС ===
В игре возможна игра с компьютером, игра с друг другом через локальную сеть, а также по Интернету с использованием таких программ, как Hamachi. Иммется режим обучения, который пока содержит только одну миссию, посвященную основам игры внутри зданий. В будущем, возможно, появятся кампании. Тажке имеется режим Doom Wars Deathmatch, который возвращает режим deathmatch из оригинальной игры Doom в реалии Doom Wars.
Полностью готова игровая основа игры(геймплей и юниты больше изменяться не будут)
24 играбельные карты для разного количества игроков + карта Doom Wars Deathmatch(также иммется возможность создания своих карт, используя встроенный редактор, а с использованием своих Lua скриптов - карту со скриптами(смотрите, как устроены Doom Wars Deathmatch и миссия обучения))

=== ТЕСТИРОВАНИЕ ===
Так как игра находится в состоянии бета-теста, вы окажете помощь проекту, если поможете с тестированием. Приветствуются любые отзывы, комментарии, а также помощь проекту.
Все данные пользователя находятся в папке doom/. Сохраненные игры находятся в doom/save/, а реплеи игр находятся в doom/logs/
1. Пытайтесь сохранять все свои реплеи(даже если игра прошла успешно и ошибок замечено не было) и присылать их либо на игровой форум, либо мне на e-mail(смотрите раздел ОБРАТНАЯ СВЯЗЬ). Если же игра закончилась аварийно, или вы забыли сохранить реплей, зайдите в папку doom/logs/ и выберите там самый новый файл, который имеет имя "log_of_stratagus_X.log"
2. Сохраняйте игру, если вы видели баг или ошибку, а затем присылайте файл с сохраненной игрой, чтобы можно было быстрее разобраться, в чем проблема.

=== ОБРАТНАЯ СВЯЗЬ ===
Официальный форум - http://forums.stratagus.com/viewforum.php?f=24
Русский форум поддержки на iddqd.ru - http://i.iddqd.ru/viewtopic.php?t=2518
Мои e-mail: iddqd_mail@mail.ru, cybermindid@gmail.com
Сайт Stratagus: http://stratagus.com
Stratagus на Launchpad: http://launchpad.net/stratagus