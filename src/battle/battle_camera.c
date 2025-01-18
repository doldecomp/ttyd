#include "battle/battle_camera.h"
#include "battle/battle.h"
#include <string.h>

extern BattleWork *_battleWorkPointer;

// this file uses -O4,s
void battleCameraInit(void) {
  BattleWork *wp = _battleWorkPointer;
  BattleCameraWork *camera;

  camera = &wp->cameraWork;
  memset(camera, 0, sizeof(BattleCameraWork));
  camera->flags = 0;
  switch (wp->fbatInfo->partyId) {
  case 1:
  case 2:
  case 3:
  case 4:
  case 5:
  case 6:
  case 7:
  case 8:
    camera->mode = 15;
    break;
  case 9:
    camera->mode = 16;
    break;
  case 0:
    camera->mode = 14;
    break;
  }
  camera->priLimit = 0;
  camera->zoom = 0.0f;
  camera->moveSpeedLv = 1;
  camera->zoomSpeedLv = 1;
  camera->position = (Vec){0.0f, 0.0f, 0.0f};
  camera->unk4 = 0;
}
