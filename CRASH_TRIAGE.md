# c-blosc2

## Closure bugs
- Trial 1 
    1. id000000
        - Segmentation Fault (Null pointer offset deref)
        - Buggy line - `c-blosc2/plugins/codecs/zfp/blosc2-zfp.c:391`
        - Status - <span style="color:green">**Fixed**</span>
        - [Issue Link](https://github.com/Blosc/c-blosc2/issues/519)
    2. id000001
        - Segmentation Fault (Null pointer offset deref)
        - Buggy line - `c-blosc2/plugins/codecs/zfp/blosc2-zfp.c:152`
        - Status - <span style="color:green">**Fixed**</span>
        - [Issue Link](https://github.com/Blosc/c-blosc2/issues/520)
    3. id000002
        - Segmentation Fault (Null pointer offset deref)
        - Buggy line - `c-blosc2/plugins/codecs/zfp/blosc2-zfp.c:641`
        - Status - <span style="color:green">**Fixed**</span>
        - [Issue Link](https://github.com/Blosc/c-blosc2/issues/521)
    4. id000010
        - Segmentation Fault (Unaddressable access)
        - Buggy line - `c-blosc2/plugins/codecs/ndlz/ndlz8x8.c:465`
        - Status - <span style="color:green">**Fixed**</span>
        - [Issue Link](https://github.com/Blosc/c-blosc2/issues/522)

## AFL++ bugs
AFL++ failed to find any of the above bugs in the 24hr trials

# gpmf-parser

## Closure bugs
- Trial 1
    1. id000000
        - SIGFPE (Fatal Arithmetic Exception)
        - Buggy line - `gpmf-parser/demo/GPMF_mp4reader.c:646`
        - Status - <span style="color:yellow">**Reported**</span>
        - [Issue Link](https://github.com/gopro/gpmf-parser/issues/177)
    2. id000002
        - Segmentation Fault - Unaddresable access
        - Buggy line - `gpmf-parser/demo/GPMF_mp4reader.c:637`
        - Status - <span style="color:yellow">**Reported**</span>
        - [Issue Link](https://github.com/gopro/gpmf-parser/issues/178)
    3. id000003
        - Segmentation Fault - Unaddressable access
        - Buggy line - `gpmf-parser/demo/GPMF_mp4reader.c:582`
        - Status - <span style="color:yellow">**Reported**</span>
        - [Issue Link](https://github.com/gopro/gpmf-parser/issues/179)

> **_NOTE:_**  None of the above bugs were found by WinFuzz, so these are completely new 3 bugs

## AFL++ bugs
AFL++ failed to find any of the above bugs in the 24hr trials
