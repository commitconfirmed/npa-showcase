#!/bin/bash
#
# Pretty pointless now that the ansible container is handled by containerlab
# May do other things in the future though and it saves some keystrokes :)

sudo containerlab destroy --cleanup
#bash ../manage.sh -a cleanup