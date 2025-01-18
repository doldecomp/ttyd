#include "parse.h"

//.bss
ParseWork parse;
static u8 buf[128];

void parseInit(void* ptr, u32 size) {
	parse.ptr = ptr;
	parse.field_0x54 = 0;
	parse.field_0x4 = 0;
	parse.size = size;
}





BOOL parsePush(const char* tag) {

}







BOOL parseGet1Next(s32 type, void* data) {
	BOOL result;

	if (type == 3) {
		result = parseGet1Next(2, data);
		result *= parseGet1Next(2, (void*)((u32)data + 4));
		result *= parseGet1Next(2, (void*)((u32)data + 4));
	}
	else {

		switch (type) {
		default:
			return TRUE;
		}
	}
	return result;
}
