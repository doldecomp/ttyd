// the best Mario Party, partners with actual abilities in Paper Mario,
// something Nintendo's forgotten about
#include "mario/mario_party.h"
#include "mario/mario.h"
#include "party.h"

s32 marioGetParty(void) {
    s32 id;

    id = marioGetPartyId();
    if (id >= 0) {
        return partyGetPtr(id)->currentMemberId;
    } else {
        return 0;
    }
}

s32 marioGetPartyId(void) {
    MarioWork* wp = marioGetPtr();
    PartyEntry* party;
    s32 partyId;

    partyId = wp->currPartySlotId[0];
    if (partyId >= 0) {
        party = partyGetPtr(partyId);
        if ((party != NULL) && !(party->flags & 8)) {
            return partyId;
        }
    }
    partyId = wp->currPartySlotId[1];
    if (partyId >= 0) {
        party = partyGetPtr(partyId);
        if ((party != NULL) && !(party->flags & 8)) {
            return partyId;
        }
    }
    return -1;
}

s32 marioGetExtraPartyId(void) {
    MarioWork* wp = marioGetPtr();
    PartyEntry* party;
    s32 partyId;

    partyId = wp->currPartySlotId[0];
    if (partyId >= 0) {
        party = partyGetPtr(partyId);
        if ((party != NULL) && (party->flags & 8)) {
            return partyId;
        }
    }

    partyId = wp->currPartySlotId[1];
    if (partyId >= 0) {
        party = partyGetPtr(partyId);
        if ((party != NULL) && (party->flags & 8)) {
            return partyId;
        }
    }
    return -1;
}

void partyJoin(MarioPartner partnerId) {
    if (partnerId < 8) {
        pouchGetPtr()->partyData[partnerId].flags |= 1; // obtained
    }
}
