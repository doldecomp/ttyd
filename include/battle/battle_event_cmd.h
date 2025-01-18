#pragma once

#include "evt/evt_cmd.h"
#include <dolphin/types.h>

USERFUNC_DEF(btlevtcmd_WaitEventEnd);
USERFUNC_DEF(btlevtcmd_check_battleflag);
USERFUNC_DEF(btlevtcmd_onoff_battleflag);
USERFUNC_DEF(btlevtcmd_get_turn);
USERFUNC_DEF(btlevtcmd_reset_turn);
USERFUNC_DEF(btlevtcmd_reset_move_color_lv_all);
USERFUNC_DEF(btlevtcmd_CheckPhase);
USERFUNC_DEF(btlevtcmd_GetPos);
USERFUNC_DEF(btlevtcmd_GetPosFloat);
USERFUNC_DEF(btlevtcmd_GetRandomValue);
USERFUNC_DEF(btlevtcmd_DrawLots);
USERFUNC_DEF(btlevtcmd_SpawnUnit);
USERFUNC_DEF(btlevtcmd_KillUnit);
USERFUNC_DEF(btlevtcmd_ReplaceParts);
USERFUNC_DEF(btlevtcmd_ChangeParty);
USERFUNC_DEF(btlevtcmd_SetPos);
USERFUNC_DEF(btlevtcmd_AddPos);
USERFUNC_DEF(btlevtcmd_GetPartsPos);
USERFUNC_DEF(btlevtcmd_SetPartsPos);
USERFUNC_DEF(btlevtcmd_AddPartsPos);
USERFUNC_DEF(btlevtcmd_SetDispOffset);
USERFUNC_DEF(btlevtcmd_SetPartsDispOffset);
USERFUNC_DEF(btlevtcmd_AddPartsDispOffset);
USERFUNC_DEF(btlevtcmd_SetTogeOffset);
USERFUNC_DEF(btlevtcmd_GetHomePos);
USERFUNC_DEF(btlevtcmd_SetHomePos);
USERFUNC_DEF(btlevtcmd_AddHomePos);
USERFUNC_DEF(btlevtcmd_SetPartsHomePos);
USERFUNC_DEF(btlevtcmd_GetHitPos);
USERFUNC_DEF(btlevtcmd_SetHitOffset);
USERFUNC_DEF(btlevtcmd_SetHitCursorOffset);
USERFUNC_DEF(btlevtcmd_GetWidth);
USERFUNC_DEF(btlevtcmd_GetHeight);
USERFUNC_DEF(btlevtcmd_SetHeight);
USERFUNC_DEF(btlevtcmd_GetStatusMg);
USERFUNC_DEF(btlevtcmd_SetStatusIconOffset);
USERFUNC_DEF(btlevtcmd_SetHpGaugeOffset);
USERFUNC_DEF(btlevtcmd_GetHpGaugeOffset);
USERFUNC_DEF(btlevtcmd_SetAlpha);
USERFUNC_DEF(btlevtcmd_GetRGB);
USERFUNC_DEF(btlevtcmd_SetRGB);
USERFUNC_DEF(btlevtcmd_GetRotate);
USERFUNC_DEF(btlevtcmd_SetRotate);
USERFUNC_DEF(btlevtcmd_AddRotate);
USERFUNC_DEF(btlevtcmd_GetPartsRotate);
USERFUNC_DEF(btlevtcmd_SetPartsRotate);
USERFUNC_DEF(btlevtcmd_AddPartsRotate);
USERFUNC_DEF(btlevtcmd_SetBaseRotate);
USERFUNC_DEF(btlevtcmd_SetPartsBaseRotate);
USERFUNC_DEF(btlevtcmd_SetRotateOffset);
USERFUNC_DEF(btlevtcmd_SetPartsRotateOffset);
USERFUNC_DEF(btlevtcmd_AddPartsRotateOffset);
USERFUNC_DEF(btlevtcmd_SetRotateOffsetFromCenterOffset);
USERFUNC_DEF(btlevtcmd_SetCutBaseOffset);
USERFUNC_DEF(btlevtcmd_SetBintaHitOffset); //Love Slap
USERFUNC_DEF(btlevtcmd_SetKissHitOffset); //Lip Lock
USERFUNC_DEF(btlevtcmd_SetCutWidth);
USERFUNC_DEF(btlevtcmd_SetCutHeight);
USERFUNC_DEF(btlevtcmd_SetPossessionItemOffset);
USERFUNC_DEF(btlevtcmd_SetBaseScale);
USERFUNC_DEF(btlevtcmd_SetPartsBaseScale);
USERFUNC_DEF(btlevtcmd_GetScale);
USERFUNC_DEF(btlevtcmd_SetScale);
USERFUNC_DEF(btlevtcmd_AddScale);
USERFUNC_DEF(btlevtcmd_SetPartsScale);
USERFUNC_DEF(btlevtcmd_AddPartsScale);
USERFUNC_DEF(btlevtcmd_GetHp);
USERFUNC_DEF(btlevtcmd_GetFp);
USERFUNC_DEF(btlevtcmd_GetMaxHp);
USERFUNC_DEF(btlevtcmd_GetMaxFp);
USERFUNC_DEF(btlevtcmd_SetHp);
USERFUNC_DEF(btlevtcmd_SetFp);
USERFUNC_DEF(btlevtcmd_SetMaxFp);
USERFUNC_DEF(btlevtcmd_SetSwallowParam);
USERFUNC_DEF(btlevtcmd_SetSwallowAttribute);
USERFUNC_DEF(btlevtcmd_SetMaxMoveCount);
USERFUNC_DEF(btlevtcmd_GetDamagePartsId);
USERFUNC_DEF(btlevtcmd_GetHpDamage);
USERFUNC_DEF(btlevtcmd_GetFpDamage);
USERFUNC_DEF(btlevtcmd_GetHpDamageCount);
USERFUNC_DEF(btlevtcmd_RecoverHp);
USERFUNC_DEF(btlevtcmd_RecoverFp);
USERFUNC_DEF(btlevtcmd_GetOverTurnCount);
USERFUNC_DEF(btlevtcmd_SetOverTurnCount);
USERFUNC_DEF(btlevtcmd_GetUnitWork);
USERFUNC_DEF(btlevtcmd_SetUnitWork);
USERFUNC_DEF(btlevtcmd_AddUnitWork);
USERFUNC_DEF(btlevtcmd_GetUnitWorkFloat);
USERFUNC_DEF(btlevtcmd_SetUnitWorkFloat);
USERFUNC_DEF(btlevtcmd_GetPartsWork);
USERFUNC_DEF(btlevtcmd_SetPartsWork);
USERFUNC_DEF(btlevtcmd_GetDamage);
USERFUNC_DEF(btlevtcmd_GetTotalDamage);
USERFUNC_DEF(btlevtcmd_GetDamageCode);
USERFUNC_DEF(btlevtcmd_CheckDamageCode);
USERFUNC_DEF(btlevtcmd_StartAvoid);
USERFUNC_DEF(btlevtcmd_RunHitEventDirect);
USERFUNC_DEF(btlevtcmd_CheckDamagePattern);
USERFUNC_DEF(btlevtcmd_CheckSpace);
USERFUNC_DEF(btlevtcmd_GetEnemyBelong);
USERFUNC_DEF(btlevtcmd_GetFriendBelong);
USERFUNC_DEF(btlevtcmd_GetProtectId);
USERFUNC_DEF(btlevtcmd_GetUnitKind);
USERFUNC_DEF(btlevtcmd_GetPartnerId);
USERFUNC_DEF(btlevtcmd_GetMarioId);
USERFUNC_DEF(btlevtcmd_GetPartyId);
USERFUNC_DEF(btlevtcmd_GetBodyId);
USERFUNC_DEF(btlevtcmd_GetUnitId);
USERFUNC_DEF(btlevtcmd_GetPartyTechLv);
USERFUNC_DEF(btlevtcmd_CalculateFaceDirection);
USERFUNC_DEF(btlevtcmd_GetFaceDirection);
USERFUNC_DEF(btlevtcmd_ChangeFaceDirection);
USERFUNC_DEF(btlevtcmd_ChangePartsFaceDirection);
USERFUNC_DEF(btlevtcmd_ResetFaceDirection);
USERFUNC_DEF(btlevtcmd_CheckAttribute);
USERFUNC_DEF(btlevtcmd_OnAttribute);
USERFUNC_DEF(btlevtcmd_OffAttribute);
USERFUNC_DEF(btlevtcmd_CheckPartsAttribute);
USERFUNC_DEF(btlevtcmd_OnPartsAttribute);
USERFUNC_DEF(btlevtcmd_OffPartsAttribute);
USERFUNC_DEF(btlevtcmd_CheckPartsCounterAttribute);
USERFUNC_DEF(btlevtcmd_OnPartsCounterAttribute);
USERFUNC_DEF(btlevtcmd_OffPartsCounterAttribute);
USERFUNC_DEF(btlevtcmd_SetPartsBlur);
USERFUNC_DEF(btlevtcmd_OnToken);
USERFUNC_DEF(btlevtcmd_OffToken);
USERFUNC_DEF(btlevtcmd_CheckToken);
USERFUNC_DEF(btlevtcmd_SetRegistStatus);
USERFUNC_DEF(btlevtcmd_CheckCommandUnit);
//USERFUNC_DEF();
//USERFUNC_DEF();
//USERFUNC_DEF();
//USERFUNC_DEF();
//USERFUNC_DEF();
//USERFUNC_DEF();
//USERFUNC_DEF();
//USERFUNC_DEF();
//USERFUNC_DEF();





















USERFUNC_DEF(btlevtcmd_ACRStart);
USERFUNC_DEF(btlevtcmd_ACRGetResult);




