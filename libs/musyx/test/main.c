#include <musyx/musyx.h>

#include <musyx/seq.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char* argv[]) {
  SND_HOOKS hooks = { malloc, free, };
  sndSetHooks(&hooks);
  sndInit(64, 64, 64, 8, 1, 1234);

  FILE* proj = fopen("../testData/test.proj", "rb");
  FILE* samp = fopen("../testData/test.samp", "rb");
  FILE* pool = fopen("../testData/test.pool", "rb");
  FILE* sdir = fopen("../testData/test.sdir", "rb");
  FILE* annie = fopen("../testData/ANNIE.song", "rb");

  if (!proj || !samp || !pool || !sdir || !annie) {
    fprintf(stderr, "Unable to locate all relevant files!\n");
    return 1;
  }

  fseek(proj, 0, SEEK_END);
  size_t projSize = ftello(proj);
  rewind(proj);
  void* projData = malloc(projSize);
  memset(projData, 0, projSize);
  fread(projData, 1, projSize, proj);
  fclose(proj);

  fseek(samp, 0, SEEK_END);
  size_t sampSize = ftello(samp);
  rewind(samp);
  void* sampData = malloc(sampSize);
  memset(sampData, 0, sampSize);
  fread(sampData, 1, sampSize, samp);
  fclose(samp);

  fseek(pool, 0, SEEK_END);
  size_t poolSize = ftello(pool);
  rewind(pool);
  void* poolData = malloc(poolSize);
  memset(poolData, 0, poolSize);
  fread(poolData, 1, poolSize, pool);
  fclose(pool);

  fseek(sdir, 0, SEEK_END);
  size_t sdirSize = ftello(sdir);
  rewind(sdir);
  void* sdirData = malloc(sdirSize);
  memset(sdirData, 0, sdirSize);
  fread(sdirData, 1, sdirSize, sdir);

  sdirData = sndConvert32BitSDIRTo64BitSDIR(sdirData);
  fclose(sdir);

  fseek(annie, 0, SEEK_END);
  size_t annieSize = ftello(annie);
  rewind(annie);
  void* annieData = malloc(annieSize);
  memset(annieData, 0, annieSize);
  fread(annieData, 1, annieSize, annie);
  fclose(annie);

  sndPushGroup(projData, 1, sampData, sdirData, poolData);
  do {
    sndFXStart(1502, 127, 64);
  } while(!sndIsIdle());

  sndQuit();

  free(projData);
  free(sampData);
  free(poolData);
  free(sdirData);
  free(annieData);
  return 0;
}