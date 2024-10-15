#include "i3-ipc++/i3_ipc.hpp"
#include "i3-ipc++/i3_containers.hpp"

// Create IPC connection
i3_ipc i3;

void move_to_scratchpad(int w_id){ 
    i3.execute_commands("[class='mousepad'] move scratchpad"); 
}

int main() {
    move_to_scratchpad(1);


    return 0;
}

