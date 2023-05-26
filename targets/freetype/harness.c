#include <ft2build.h>
#include FT_FREETYPE_H
int main(int argc, char ** argv){

FT_Library  library;   /* handle to library     */
FT_Face     face;      /* handle to face object */


FT_Init_FreeType( &library );
//if ( error ) { ... }

FT_New_Face( library,
                     argv[1],
                     0,
                     &face );

return 0;
}

