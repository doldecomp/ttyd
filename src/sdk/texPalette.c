/* "texPalette" - Texture Palette Library (TPL)
 * Status: Complete, not 1:1 (need to remove entry in UnpackTexPalette? and
 * add inlining for TEXGet in first line of TEXGetGXTexObjFromPalette and
 * add perfect line numbering for OSHalt, technically)
 *
 * Function: used for parsing TPL files
 */
#include "sdk/texPalette.h"

void TEXGetGXTexObjFromPalette(TPLHeader* header, GXTexObj* obj, u32 id) {
	TPLImageHeader* image = TEXGet(header, id)->image;

	GXInitTexObj(
		obj,
		image->data,
		image->width,
		image->height,
		image->format,
		image->wrapS,
		image->wrapT,
		(GXBool)(image->minLOD != image->maxLOD)
	);

	GXInitTexObjLOD(
		obj,
		image->minFilter,
		image->magFilter,
		image->minLOD,
		image->maxLOD,
		image->LODBias,
		GX_DISABLE,
		image->edgeLODEnable,
		GX_ANISO_1
	);
}

TPLImageEntry* TEXGet(TPLHeader* header, u32 id) {
	return &header->imageTable[id];
}

void UnpackTexPalette(TPLHeader* header) {
	TPLImageEntry* entry;
	u16 i; //not int

	if (header->version != 0x0020AF30) {
		OSHalt("invalid version number for texture palette");
	}
	if (header->imageTableOffset <= 0x80000000) { //max file size
		header->imageTableOffset += (u32)header; //absolute position
		for (i = 0; i < header->imageCount; i++) {
			entry = &header->imageTable[i];
			if (entry->image != NULL) {
				entry->imageOffset += (u32)header; //absolute position
				if (!entry->image->unpacked) {
					entry->image->dataOffset += (u32)header;
					entry->image->unpacked = TRUE;
				}
			}
			if (entry->palette != NULL) {
				entry->paletteOffset += (u32)header; //absolute position
				if (!entry->palette->unpacked) {
					entry->palette->dataOffset += (u32)header;
					entry->palette->unpacked = TRUE;
				}
			}
		}
	}
}
