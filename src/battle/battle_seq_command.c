#include "battle/battle_seq_command.h"
#include "battle/battle.h"
#include "battle/battle_monosiri.h"
#include "battle/battle_unit.h"
#include "driver/camdrv.h"
#include "driver/dispdrv.h"

//TODO: move into battle/seq/?

//local prototypes
void BattleDrawEnemyHP(CameraId camId, void* param);

void BattleDrawEnemyHP(CameraId camId, void* param) {
	BattleWork* wp = param;
	BattleWorkUnit* unit;
	Vec position;
	int i;

	camGetPtr(CAMERA_2D); //unused, probably just stored

	for (i = 0; i < 64; i++) {
		unit = wp->mUnits[i];
		if (unit) {
			if (!BtlUnit_CheckStatus(unit, kStatusInstantKill)) {
				if (battleCheckUnitMonosiriFlag(unit)) {
					if (!unit->mAttributeFlags & 0x2000000) {
						if (wp->commandMenu.unk4 & 0x1000000) {
							if (unit->mFlags & 1) {
								position.x = unit->mPosition.x;
								position.y = unit->mPosition.y;
								position.z = unit->mPosition.z;
								if (wp->flags & 0x80) {
									position.x = unit->mHomePosition.x;
									position.y = unit->mHomePosition.y;
									position.z = unit->mHomePosition.z;
								}
								position.x += (f32)unit->mHpGaugeOffset[0];
								position.y += (f32)unit->mHpGaugeOffset[1];
							}
						}
					}
				}
			}
		}
	}
}
