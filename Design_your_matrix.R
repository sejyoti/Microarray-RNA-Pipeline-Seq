#📐 Step 3: Design Matrix & Contrasts

design <- model.matrix(~ 0 + groups_clean)
colnames(design) <- levels(groups_clean)

contrast <- makeContrasts(LuminalAvsBasal = LuminalA - Basal, levels = design)
