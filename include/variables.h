#ifndef __VARIABLES_H_
#define __VARIABLES_H_

// TODO: Move some of these to their own header files

typedef struct seqdrv_work {
	s32 field_0x0; //0x0, seq_num
	s32 field_0x4; //0x4, 0-7, see seq_mapChangeMain
	char* field_0x8; //0x8, "next_p0"
	char* field_0xC; //0xC, "next_p1"
	u32 field_0x10; //0x10
	u32 field_0x14; //0x14
	u32 field_0x18; //0x18
	u32 field_0x1C; //0x1C
} seqdrv_work;

// TODO: Port all symbols from known decomp
struct MarioState {
    char filler0[0x174];
	u32 mGSW0; //0x174, first entry is a u32
	u32 mGSFW[0x100]; //0x178
	u8 mGSW[0x800]; //0x578
	u32 mLSWF[0x10]; //0xD78
	u8 mLSW[0x400]; //0xDB8
    char filler11B8[0x15C];
    u32 tickStore1;
    u32 tickStore2;
};

extern struct MarioState *gp; // gp

/*
struct ARCFile {
    
};
*/

// based on WiiCore
enum ARCType
{
  //! The entry is a file.
  //! Accessed via rxArchiveFile with rxArchiveFileOpen/rxArchiveFileOpenLow
  //!
  RX_ARCHIVE_FILE,

  //! The entry is a folder.
  //!
  RX_ARCHIVE_FOLDER
};

struct ARCHandle
{
  const struct ARCHeader* mHeader; //!< 00 Pointer to the archive header.
  const struct ARCNode* mNodes; //!< 04 Array of nodes for each archive entry.
  const u8* mFileData;         //!< 08 File data buffer, accessed by nodes.
  u32 mCount;                  //!< 0C Number of nodes in the archive.
  const char* mStrings;        //!< 10 String buffer, accessed by nodes.
  u32 mFstSize;                //!< 14 Total bytesize of nodes and strings.
  u32 mCurrentPath;            //!< 18 The current directory of the archive.
};

struct ARCFile
{
  struct ARCHandle* parent; //!< 00 The archive the file is a part of.
  u32 offset;        //!< 04 Offset into the archive's file data buffer.
  u32 size;          //!< 08 Size of the file.
};

struct ARCEntry
{
  struct ARCHandle* parent;       //!< 00 The archive the file is a part of.
  u32 path;                //!< 04 Special ID corresponding to a file path.
                           //!< Accepted by rxArchiveFileOpenLow.
  enum ARCType node_type; //!< The entry type.
  const char* name;        //!< 0C Name of this entry in specific.
                           //!< (Not an absolute path)
};

struct ARCDir
{
  struct ARCHandle* parent; //!< 00 The archive the file is a part of.
  u32 path_begin;    //!< 04 The lower bound of the iterator range.
  u32 path_it;       //!< 08 The current position of the iterator.
  u32 path_end;      //!< 0C The upper bound of the iterator range.
};

struct ARCNode {
  union {
    struct {
      u32 is_folder : 8;
      u32 name : 24;
    };
    u32 packed_type_name;
  };
  union {
    struct {
      u32 offset;
      u32 size;
    } file;
    struct {
      u32 parent;
      u32 sibling_next;
    } folder;
  };
};

struct ARCHeader {
  u32 magic; // 00
  struct {
    s32 offset; // 04
    s32 size;   // 08
  } nodes;
  struct {
    s32 offset; // 0C
  } files;

  u8 _10[0x10];
};

typedef struct ARCHandle rxArchive;
typedef struct ARCFile rxArchiveFile;
typedef struct ARCDir rxArchiveFolderRange;
typedef struct ARCEntry rxArchiveEntry;
typedef struct ARCNode rxNode;
typedef struct ARCHeader rxArchiveHeader;

struct ARCHeaderNew {
    /*0x0000*/ u16 unk0; // enabled stat?
    /*0x0004*/ rxArchive arcfile;
    /*0x0020*/ void *param_2;
    /*0x0024*/ void *param_3;
}; // size = 0x28

extern struct ARCHeaderNew lbl_803D8470[4];

#endif
