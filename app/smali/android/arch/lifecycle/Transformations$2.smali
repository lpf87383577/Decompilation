.class final Landroid/arch/lifecycle/Transformations$2;
.super Ljava/lang/Object;
.source "Transformations.java"

# interfaces
.implements Landroid/arch/lifecycle/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/arch/lifecycle/Transformations;->switchMap(Landroid/arch/lifecycle/LiveData;Landroid/arch/core/util/Function;)Landroid/arch/lifecycle/LiveData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/arch/lifecycle/Observer<",
        "TX;>;"
    }
.end annotation


# instance fields
.field mSource:Landroid/arch/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/arch/lifecycle/LiveData<",
            "TY;>;"
        }
    .end annotation
.end field

.field final synthetic val$func:Landroid/arch/core/util/Function;

.field final synthetic val$result:Landroid/arch/lifecycle/MediatorLiveData;


# direct methods
.method constructor <init>(Landroid/arch/core/util/Function;Landroid/arch/lifecycle/MediatorLiveData;)V
    .locals 0

    .line 128
    iput-object p1, p0, Landroid/arch/lifecycle/Transformations$2;->val$func:Landroid/arch/core/util/Function;

    iput-object p2, p0, Landroid/arch/lifecycle/Transformations$2;->val$result:Landroid/arch/lifecycle/MediatorLiveData;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged(Ljava/lang/Object;)V
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TX;)V"
        }
    .end annotation

    .line 133
    iget-object v0, p0, Landroid/arch/lifecycle/Transformations$2;->val$func:Landroid/arch/core/util/Function;

    invoke-interface {v0, p1}, Landroid/arch/core/util/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/arch/lifecycle/LiveData;

    .line 134
    iget-object v0, p0, Landroid/arch/lifecycle/Transformations$2;->mSource:Landroid/arch/lifecycle/LiveData;

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    if-eqz v0, :cond_1

    .line 138
    iget-object v1, p0, Landroid/arch/lifecycle/Transformations$2;->val$result:Landroid/arch/lifecycle/MediatorLiveData;

    invoke-virtual {v1, v0}, Landroid/arch/lifecycle/MediatorLiveData;->removeSource(Landroid/arch/lifecycle/LiveData;)V

    .line 140
    :cond_1
    iput-object p1, p0, Landroid/arch/lifecycle/Transformations$2;->mSource:Landroid/arch/lifecycle/LiveData;

    .line 141
    iget-object p1, p0, Landroid/arch/lifecycle/Transformations$2;->mSource:Landroid/arch/lifecycle/LiveData;

    if-eqz p1, :cond_2

    .line 142
    iget-object v0, p0, Landroid/arch/lifecycle/Transformations$2;->val$result:Landroid/arch/lifecycle/MediatorLiveData;

    new-instance v1, Landroid/arch/lifecycle/Transformations$2$1;

    invoke-direct {v1, p0}, Landroid/arch/lifecycle/Transformations$2$1;-><init>(Landroid/arch/lifecycle/Transformations$2;)V

    invoke-virtual {v0, p1, v1}, Landroid/arch/lifecycle/MediatorLiveData;->addSource(Landroid/arch/lifecycle/LiveData;Landroid/arch/lifecycle/Observer;)V

    :cond_2
    return-void
.end method
