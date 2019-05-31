DefineAiHelper(
	{"unit-equiv", "unit-command-center", "unit-advanced-command-center"}
)

DefineAiHelper(
	{"unit-equiv", "unit-lostsoul", "unit-advanced-lostsoul"},
	{"unit-equiv", "unit-phantom", "unit-new-phantom"},
	{"unit-equiv", "unit-generator-hell", "unit-advanced-generator-hell"},
	{"unit-equiv", "unit-fire-tower", "unit-upgraded-fire-tower"}
)

GlobalAiTable = {
	"ai-passive", "scripts/ai/passive.lua",
	"tech-passive", "scripts/ai/tech_attack.lua",
	"complex-passive", "scripts/ai/tech_attack.lua"
}
 
Load("scripts/ai/passive.lua")
Load("scripts/ai/tech_attack.lua")
Load("scripts/ai/complex_attack.lua")