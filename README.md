# UNIX-02-SIN-A-Mar-Jul-2026
<<<<<<< HEAD
Repo for intro to UNIX
=======
Repo for intro to UNIX
**Exercises**

---

**1. Verify the firmware type: Run [ -d /sys/firmware/efi ] && echo "UEFI" || echo "BIOS" both in the Codespace and within QEMU. What result do you get and why?**
The command uses a shell conditional structure to validate the existence of the /sys/firmware/efi directory, where the [ parameter initiates the expression evaluator, -d specifically checks if the specified path is a directory, and the && (AND) and || (OR) operators determine which word to print depending on the success or failure of the search. In both environments, Codespaces and QEMU, the result was BIOS because the system did not detect the UEFI interface. This occurs because GitHub Codespaces containers operate on Legacy BIOS-based virtualization, and the executed QEMU command does not include the OVMF firmware load parameter necessary to emulate UEFI, booting by default in legacy compatibility mode.

---

**2. Inspect the structure: Within QEMU, run ls / and compare it to the directory structure we saw in class. Which directories are missing and why?**
Comparing the output of ls / with the FHS standard discussed in class reveals an incomplete structure where only bin, dev, and usr are present, in addition to the init file. Fundamental directories such as /etc for configurations, /home for users, /tmp for temporary files, and /var for variable data like logs are missing. These absences occur because the current system is an extremely basic initramfs environment: with no active services, created users, or running databases, the kernel doesn't need to generate these paths, limiting itself to only the essential directories for containing the BusyBox binaries and the initial startup script.

---

**3. Explore BusyBox: Within QEMU, run ls -la /bin/ and observe that all the commands are symbolic links to the same binary. What advantage does this offer for an embedded system?**
Running ls -la /bin/ reveals that the vast majority of files display the letter l at the beginning of their permissions and an arrow pointing towards busybox, indicating that they are symbolic links. This "multi-level binary" architecture is fundamental for embedded systems because it allows for massive disk space savings, since a single compact executable contains the code for hundreds of UNIX tools. Furthermore, it optimizes RAM usage by loading a single instance of the program to perform various tasks, making it ideal for devices with limited storage and memory.

---

**4. Examine blocks: In the Codespace, create a file with echo "hello" > test.txt and then run stat test.txt. Identify the actual size versus the allocated blocks. Is there internal fragmentation?**
Running stat test.txt shows an actual size (Size) of 5 bytes, while the system has allocated 8 blocks of 512 bytes each, totaling 4096 bytes (the value indicated in IO Block). This discrepancy confirms the existence of internal fragmentation, since the file system allocates space in predefined minimum units called blocks. Because the file content is significantly smaller than the allocated block size, most of the physical space within that block remains empty and cannot be used by other files, demonstrating wasted storage on files of minimal size.

---

**5. Analyze partitions: Run sudo parted -l && echo -e "\n---\n" && lsblk -f in the Codespace. Identify which disks use GPT versus MBR, and which filesystems are in use.**
Analysis of the results reveals that the Codespaces environment uses a mixed partition table configuration: the /dev/sda disk employs the older MS-DOS (MBR) scheme, while the /dev/sdb and /dev/sdc disks use the modern GPT standard, as evidenced by the presence of specific boot partitions such as bios_grub and boot, esp. Regarding file systems, most data partitions are formatted in ext4, the Linux standard due to its stability, while the system boot partition (/dev/sdb15) uses FAT32 to ensure compatibility with the boot firmware. This organization allows the environment to efficiently manage everything from small system partitions to large storage volumes, such as the 550GB disk dedicated to general data.

