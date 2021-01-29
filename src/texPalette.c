#include "global.h"
#include "texpalette.h"

void UnpackTexPalette(TPLHeader* header);
TPLImageEntry* TEXGet(TPLHeader* header, u32 id);
void TEXGetGXTexObjFromPalette(TPLHeader* header, GXTexObj* obj, u32 id);

void UnpackTexPalette(TPLHeader* header) {
    TPLImageEntry* entry;
    u16 i;
    if (header->version != 0x0020AF30) {
        OSPanic("texPalette.c", 36, "invalid version number for texture palette") ;
    }
    if (header->imageTableOffset <= 0x80000000) {
        header->imageTableOffset += (u32)header;
        for (i = 0; i < header->imageCount; i++) {
            if (header->imageTable[i].image != NULL) {
                header->imageTable[i].imageOffset = (u32)header + header->imageTable[i].imageOffset;
                if (header->imageTable[i].image->unpacked == 0) {
                    header->imageTable[i].image->dataOffset = (u32)header + header->imageTable[i].image->dataOffset;
                    header->imageTable[i].image->unpacked = 1 ;
                }
            }
            if (header->imageTable[i].palette != NULL) {
                header->imageTable[i].paletteOffset = (u32)header + header->imageTable[i].paletteOffset;
                if (header->imageTable[i].palette->unpacked == 0) {
                    header->imageTable[i].palette->dataOffset = (u32)header + header->imageTable[i].palette->dataOffset;
                    header->imageTable[i].palette->unpacked = 1 ;
                }
            }
        }
    }
}

TPLImageEntry* TEXGet(TPLHeader* header, u32 id) {
    return &header->imageTable[id];
}

void TEXGetGXTexObjFromPalette(TPLHeader* header, GXTexObj* obj, u32 id) {
    TPLImageEntry* entry = TEXGet(header, id);
    GXBool mybool;
    
    if (entry->image->minLOD == entry->image->maxLOD) {
       mybool = FALSE;
    } else {
       mybool = TRUE;
    }

    GXInitTexObj(
        obj,
        entry->image->data,
        entry->image->width,
        entry->image->height,
        entry->image->format,
        entry->image->wrapS,
        entry->image->wrapT,
        mybool
    );

    GXInitTexObjLOD(
        obj,
        entry->image->minFilter,
        entry->image->magFilter,
        entry->image->minLOD,
        entry->image->maxLOD,
        entry->image->LODBias,
        GX_DISABLE,
        entry->image->edgeLODEnable,
        GX_ANISO_1
    );
}
