# MemoryGame

Simple Perl+Amon2+jQuery game.

git clone MemoryGame

You need to install the dependencies by:

    > carton install

And then, run your application server:

    > perl script/matchgame-server
    
Db is in repository but you may update it if needed:
    > cd sql
    > sqlite3 MemoryGame.db < Memory.SQL
