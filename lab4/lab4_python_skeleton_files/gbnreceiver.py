import socket
import sys
import binascii

RECEIVER_IP = #====fill in here====
SENDER_IP = #====fill in here====
PORT = 5000 

#===================
#ACKNOWLEDGEMENT MESSAGE
#===================
ACK = ""

RECV_BUFFER = 1024
# Create a UDP socket
UDP_SOCKET = #====fill in here====
UDP_SOCKET.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1) 

# Bind the UDP socket to RECEIVER_IP and PORT
#====fill in here====


# Receive packets from UDP socket
def rdt_rcv():
    # Receive a rcvpkt  from the sender
    rcvpkt, address = #====fill in here====
    return rcvpkt


# Send packet over unreliable data transprot(UDP)
def udt_send(pkt):
    print(f"send ACK{int.from_bytes(pkt[0:5], byteorder = 'little', signed = True)}")
    #Send "pkt" to the sender
    #====fill in here====


# Creates a packet in bytes from seqnum, data and checksum
def make_pkt(seqnum, ACK, checksum):
    seqnum_bytes = seqnum.to_bytes(5, byteorder = 'little', signed = True)
    ACK_bytes = ACK.encode('utf-8')
    checksum_bytes = checksum.to_bytes(5, byteorder = 'little', signed = True)
    return seqnum_bytes+checksum_bytes+ACK_bytes


# Check if a received packet is not corrupted
def notcorrupt(rcvpkt):
    acknum = int.from_bytes(rcvpkt[0:5], byteorder = 'little', signed = True)
    checksum = int.from_bytes(rcvpkt[5:10], byteorder = 'little', signed = True)
    ACK = rcvpkt[10:].decode('utf-8')
    computed_checksum = compute_checksum(acknum, ACK)
    return (checksum == computed_checksum)


# Extract seqnum,checksum and  payload from a received packet
def extract(rcvpkt):
    data = rcvpkt[10:].decode('utf-8')
    if data:
        print(f"rcv pkt{int.from_bytes(rcvpkt[0:5],byteorder='little',signed=True)},deliver")
    else:
        sys.exit()
    return data


# Write received data to a file
def deliver_data(data):
    with open('./rcvdata.txt', 'a') as f:
        f.write(data)


# Check if a received packet has a seqnum as the expectedseqnum
def hasseqnum(rcvpkt, expectedseqnum):
    seqnum = int.from_bytes(rcvpkt[0:5], byteorder = 'little', signed = True)
    return (seqnum == expectedseqnum)


# Computes cyclic redundancy check (CRC), the 32-bit checksum of (seqnum + payload)
def compute_checksum(seqnum, payload):
    seqnum_bytes = seqnum.to_bytes(5, byteorder = 'little', signed = True)
    payload_bytes = payload.encode('utf-8')
    checksum = binascii.crc32(seqnum_bytes+payload_bytes)
    return checksum


# Start receiving packets
def receive():
    # Figure2, circle 1: Initial state of GBN receiver
    expectedseqnum = 0
    checksum = compute_checksum(-1, ACK)
    sndpkt=make_pkt(-1, ACK, checksum)

    while True:
        rcvpkt = rdt_rcv()

        # Figure2, circle 2:
        if rcvpkt and notcorrupt(rcvpkt) and hasseqnum(rcvpkt, expectedseqnum):
            data = extract(rcvpkt)
            deliver_data(data)
            checksum = compute_checksum(expectedseqnum, ACK)

            # make sndpkt using make_pkt function
            #====fill in here====

            # send the packet using udt_send function
            #====fill in here====

            # increment expectedseqnum
            #====fill in here==== 

        
        # Figure2, circle 3: send ack of the last received pakt   
        else:
            # Hint: use udt_send function
            #====fill in here====
            print(f"rcv pkt{int.from_bytes(rcvpkt[0:5],byteorder='little',signed=True)},discard")


if __name__ == '__main__':
    receive()
    UDP_SOCKET.close()
