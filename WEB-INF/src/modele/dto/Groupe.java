package modele.dto;

import java.time.LocalDateTime;

public class Groupe {
    private int gid;
    private int uid;
    private int pid;
    private String nomGrp;
    private String description;
    private LocalDateTime dcreat;
    
    public Groupe(int gid, int uid, int pid, String nomGrp, String description, LocalDateTime dcreat) {
        this.gid = gid;
        this.uid = uid;
        this.pid = pid;
        this.nomGrp = nomGrp;
        this.description = description;
        this.dcreat = dcreat;
    }

    @Override
    public String toString() {
        return "Groupe [gid=" + gid + ", uid=" + uid + ", pid=" + pid + ", nomGrp=" + nomGrp + ", description="
                + description + ", dcreat=" + dcreat + "]";
    }

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getNomGrp() {
        return nomGrp;
    }

    public void setNomGrp(String nomGrp) {
        this.nomGrp = nomGrp;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDateTime getDcreat() {
        return dcreat;
    }

    public void setDcreat(LocalDateTime dcreat) {
        this.dcreat = dcreat;
    }
}
