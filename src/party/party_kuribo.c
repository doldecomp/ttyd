#include "party/party_kuribo.h"
#include "evt/evt_cmd.h"
#include "mario/mario_party.h"
#include "party.h"
#include "pmario_sound.h"

//.sbss
u32 msg_ep; //unknown since it only gets written to once and never used

BOOL christineGetStatus(void) {
    PartyEntry* party = partyGetPtr(marioGetPartyId());
    if (!party || party->currentMemberId != PARTY_GOOMBELLA || !(party->flags & 0x100)) {
        return FALSE;
    }
    return TRUE;
}

USER_FUNC(pre_kurio_use) {
    PartyEntry* party = partyGetPtr(marioGetPartyId());

    if (!party) {
        return EVT_RETURN_DONE;
    }

    if (party->flags2 & 0x4000000) {
        return EVT_RETURN_DONE;
    }

    psndSetFlag(0x80);
    party->flags |= 0x04000000;
    party->flags |= 0x02000000;

    if (event->lwData[0]) {
        event->lwData[0] += 8;
        return EVT_RETURN_DONE;
    }

    
}
