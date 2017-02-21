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



TODO.
1) add game status and result page with results.
2) save game and restore it when refresh
3) add posibility to play 2 players from 2 different computers.
