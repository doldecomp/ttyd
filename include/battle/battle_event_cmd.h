#pragma once

#include "evt/evt_cmd.h"
#include <dolphin/types.h>

USER_FUNC(btlevtcmd_WaitEventEnd);
USER_FUNC(btlevtcmd_check_battleflag);
USER_FUNC(btlevtcmd_onoff_battleflag);
USER_FUNC(btlevtcmd_get_turn);
USER_FUNC(btlevtcmd_reset_turn);
USER_FUNC(btlevtcmd_reset_move_color_lv_all);
USER_FUNC(btlevtcmd_CheckPhase);
USER_FUNC(btlevtcmd_GetPos);
USER_FUNC(btlevtcmd_GetPosFloat);
USER_FUNC(btlevtcmd_GetRandomValue);
USER_FUNC(btlevtcmd_DrawLots);
USER_FUNC(btlevtcmd_SpawnUnit);
USER_FUNC(btlevtcmd_KillUnit);
USER_FUNC(btlevtcmd_ReplaceParts);
USER_FUNC(btlevtcmd_ChangeParty);
USER_FUNC(btlevtcmd_SetPos);
USER_FUNC(btlevtcmd_AddPos);
USER_FUNC(btlevtcmd_GetPartsPos);
USER_FUNC(btlevtcmd_SetPartsPos);
USER_FUNC(btlevtcmd_AddPartsPos);
USER_FUNC(btlevtcmd_SetDispOffset);
USER_FUNC(btlevtcmd_SetPartsDispOffset);
USER_FUNC(btlevtcmd_AddPartsDispOffset);
USER_FUNC(btlevtcmd_SetTogeOffset);
USER_FUNC(btlevtcmd_GetHomePos);
USER_FUNC(btlevtcmd_SetHomePos);
USER_FUNC(btlevtcmd_AddHomePos);
USER_FUNC(btlevtcmd_SetPartsHomePos);
USER_FUNC(btlevtcmd_GetHitPos);
USER_FUNC(btlevtcmd_SetHitOffset);
USER_FUNC(btlevtcmd_SetHitCursorOffset);
USER_FUNC(btlevtcmd_GetWidth);
USER_FUNC(btlevtcmd_GetHeight);
USER_FUNC(btlevtcmd_SetHeight);
USER_FUNC(btlevtcmd_GetStatusMg);
USER_FUNC(btlevtcmd_SetStatusIconOffset);
USER_FUNC(btlevtcmd_SetHpGaugeOffset);
USER_FUNC(btlevtcmd_GetHpGaugeOffset);
USER_FUNC(btlevtcmd_SetAlpha);
USER_FUNC(btlevtcmd_GetRGB);
USER_FUNC(btlevtcmd_SetRGB);
USER_FUNC(btlevtcmd_GetRotate);
USER_FUNC(btlevtcmd_SetRotate);
USER_FUNC(btlevtcmd_AddRotate);
USER_FUNC(btlevtcmd_GetPartsRotate);
USER_FUNC(btlevtcmd_SetPartsRotate);
USER_FUNC(btlevtcmd_AddPartsRotate);
USER_FUNC(btlevtcmd_SetBaseRotate);
USER_FUNC(btlevtcmd_SetPartsBaseRotate);
USER_FUNC(btlevtcmd_SetRotateOffset);
USER_FUNC(btlevtcmd_SetPartsRotateOffset);
USER_FUNC(btlevtcmd_AddPartsRotateOffset);
USER_FUNC(btlevtcmd_SetRotateOffsetFromCenterOffset);
USER_FUNC(btlevtcmd_SetCutBaseOffset);
USER_FUNC(btlevtcmd_SetBintaHitOffset); //Love Slap
USER_FUNC(btlevtcmd_SetKissHitOffset); //Lip Lock
USER_FUNC(btlevtcmd_SetCutWidth);
USER_FUNC(btlevtcmd_SetCutHeight);
USER_FUNC(btlevtcmd_SetPossessionItemOffset);
USER_FUNC(btlevtcmd_SetBaseScale);
USER_FUNC(btlevtcmd_SetPartsBaseScale);
USER_FUNC(btlevtcmd_GetScale);
USER_FUNC(btlevtcmd_SetScale);
USER_FUNC(btlevtcmd_AddScale);
USER_FUNC(btlevtcmd_SetPartsScale);
USER_FUNC(btlevtcmd_AddPartsScale);
USER_FUNC(btlevtcmd_GetHp);
USER_FUNC(btlevtcmd_GetFp);
USER_FUNC(btlevtcmd_GetMaxHp);
USER_FUNC(btlevtcmd_GetMaxFp);
USER_FUNC(btlevtcmd_SetHp);
USER_FUNC(btlevtcmd_SetFp);
USER_FUNC(btlevtcmd_SetMaxFp);
USER_FUNC(btlevtcmd_SetSwallowParam);
USER_FUNC(btlevtcmd_SetSwallowAttribute);
USER_FUNC(btlevtcmd_SetMaxMoveCount);
USER_FUNC(btlevtcmd_GetDamagePartsId);
USER_FUNC(btlevtcmd_GetHpDamage);
USER_FUNC(btlevtcmd_GetFpDamage);
USER_FUNC(btlevtcmd_GetHpDamageCount);
USER_FUNC(btlevtcmd_RecoverHp);
USER_FUNC(btlevtcmd_RecoverFp);
USER_FUNC(btlevtcmd_GetOverTurnCount);
USER_FUNC(btlevtcmd_SetOverTurnCount);
USER_FUNC(btlevtcmd_GetUnitWork);
USER_FUNC(btlevtcmd_SetUnitWork);
USER_FUNC(btlevtcmd_AddUnitWork);
USER_FUNC(btlevtcmd_GetUnitWorkFloat);
USER_FUNC(btlevtcmd_SetUnitWorkFloat);
USER_FUNC(btlevtcmd_GetPartsWork);
USER_FUNC(btlevtcmd_SetPartsWork);
USER_FUNC(btlevtcmd_GetDamage);
USER_FUNC(btlevtcmd_GetTotalDamage);
USER_FUNC(btlevtcmd_GetDamageCode);
USER_FUNC(btlevtcmd_CheckDamageCode);
USER_FUNC(btlevtcmd_StartAvoid);
USER_FUNC(btlevtcmd_RunHitEventDirect);
USER_FUNC(btlevtcmd_CheckDamagePattern);
USER_FUNC(btlevtcmd_CheckSpace);
USER_FUNC(btlevtcmd_GetEnemyBelong);
USER_FUNC(btlevtcmd_GetFriendBelong);
USER_FUNC(btlevtcmd_GetProtectId);
USER_FUNC(btlevtcmd_GetUnitKind);
USER_FUNC(btlevtcmd_GetPartnerId);
USER_FUNC(btlevtcmd_GetMarioId);
USER_FUNC(btlevtcmd_GetPartyId);
USER_FUNC(btlevtcmd_GetBodyId);
USER_FUNC(btlevtcmd_GetUnitId);
USER_FUNC(btlevtcmd_GetPartyTechLv);
USER_FUNC(btlevtcmd_CalculateFaceDirection);
USER_FUNC(btlevtcmd_GetFaceDirection);
USER_FUNC(btlevtcmd_ChangeFaceDirection);
USER_FUNC(btlevtcmd_ChangePartsFaceDirection);
USER_FUNC(btlevtcmd_ResetFaceDirection);
USER_FUNC(btlevtcmd_CheckAttribute);
USER_FUNC(btlevtcmd_OnAttribute);
USER_FUNC(btlevtcmd_OffAttribute);
USER_FUNC(btlevtcmd_CheckPartsAttribute);
USER_FUNC(btlevtcmd_OnPartsAttribute);
USER_FUNC(btlevtcmd_OffPartsAttribute);
USER_FUNC(btlevtcmd_CheckPartsCounterAttribute);
USER_FUNC(btlevtcmd_OnPartsCounterAttribute);
USER_FUNC(btlevtcmd_OffPartsCounterAttribute);
USER_FUNC(btlevtcmd_SetPartsBlur);
USER_FUNC(btlevtcmd_OnToken);
USER_FUNC(btlevtcmd_OffToken);
USER_FUNC(btlevtcmd_CheckToken);
USER_FUNC(btlevtcmd_SetRegistStatus);
USER_FUNC(btlevtcmd_CheckCommandUnit);
//USER_FUNC();
//USER_FUNC();
//USER_FUNC();
//USER_FUNC();
//USER_FUNC();
//USER_FUNC();
//USER_FUNC();
//USER_FUNC();
//USER_FUNC();





















USER_FUNC(btlevtcmd_ACRStart);
USER_FUNC(btlevtcmd_ACRGetResult);
