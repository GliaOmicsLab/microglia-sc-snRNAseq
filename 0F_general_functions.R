#Functions for conversion of gene symbols to Ensembl IDs and vice versa 
#gi - gene of interest
Symbol_to_ENSEMBL <- function(gi){
  genelist <- NULL
  for(i in 1:length(gi)){
    genelist <- c(genelist, gene_symbol[gene_symbol$gene_name %in% gi[i],]$gene_id)
  }
  return(genelist)
}

ENSEMBL_to_Symbol <- function(gi){
  genelist <- NULL
  for(i in 1:length(gi)){
    genelist <- c(genelist,gene_symbol[gene_symbol$gene_id %in% gi[i],]$gene_name)
  }
  return(genelist)
}


# predefined theme for gg plotting
theme_mk <- theme_bw() + theme(
  text = element_text(size = 6),
  axis.text.x = element_text(size = 6),
  axis.text.y = element_text(size = 6),
  legend.text = element_text(size = 6, margin = margin(t = 0, r = 0, b = -1, l = 1)),  
  strip.text = element_text(size = 6),
  plot.title = element_blank(),
  legend.key.size = unit(2.5, "mm"),
  line = element_line(linewidth = 0.3),
  legend.background = element_blank(),
  legend.margin = margin(t = 0, r = 0, b = 0, l = 0),  # Margins around the legend
  legend.key.spacing.y = unit(0.0, "mm"),
  legend.key.spacing.x = unit(0.1, "mm"),
  legend.title = element_text(size = 6),
  panel.border = element_blank(),  # Remove all borders first
  axis.line = element_line(color = "black", linewidth = 0.3)  # Add bottom and left borders
  )

# predefined theme for gg plotting
theme_mk_title <- theme_bw() + theme(
  text = element_text(size = 6),
  axis.text.x = element_text(size = 6),
  axis.text.y = element_text(size = 6),
  legend.text = element_text(size = 6, margin = margin(t = 0, r = 0, b = -1, l = 1)),  
  strip.text = element_text(size = 6),
  plot.title = element_text(hjust = 0.5, size = 7.3, vjust = 0),
  legend.key.size = unit(2.5, "mm"),
  line = element_line(linewidth = 0.3),
  legend.background = element_blank(),
  legend.margin = margin(t = 0, r = 0, b = 0, l = 0),  # Margins around the legend
  legend.key.spacing.y = unit(0.0, "mm"),
  legend.key.spacing.x = unit(0.1, "mm"),
  legend.title = element_text(size = 6),
  panel.border = element_blank(),  # Remove all borders first
  axis.line = element_line(color = "black", linewidth = 0.3)  # Add bottom and left borders
)


theme_umap <- theme_classic() + 
  theme(
    text = element_text(size = 6),
    legend.position = "bottom",             # Position the legend at the bottom
    legend.text = element_text(size = 6, margin = margin(t = 0, r = 0, b = -1, l = 1)),    # Optional: adjust legend text size
    legend.key.spacing.y = unit(0, "mm"),
    legend.key.spacing.x = unit(1, "mm"),
    legend.margin = margin(t = 0, r = 0, b = 0, l = 0),  # Margins around the legend,
    plot.margin = margin(0, 0, 2, 0),
    strip.text = element_text(size = 6),
    plot.title = element_text(hjust = 0.5, size = 7.3, vjust = 0),
    legend.key.size = unit(2.5, "mm"),      # Control overall legend key size
    legend.background = element_blank()
  ) 



# remove grid from ggplot backgrounds
remove_grid <- theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())

# remove axes from ggplot backgrounds
remove_axes <- theme(
  axis.title.x = element_blank(), # Remove x-axis title
  axis.title.y = element_blank(), # Remove y-axis title
  axis.text.x = element_blank(),  # Remove x-axis text
  axis.text.y = element_blank(),  # Remove y-axis text
  axis.ticks.x = element_blank(), # Remove x-axis ticks
  axis.ticks.y = element_blank(), # Remove y-axis ticks
  axis.line.x = element_blank(),  # Remove x-axis line
  axis.line.y = element_blank()   # Remove y-axis line
)

#different size of labels
compareInteractions <- function(object, measure = c("count", "weight"), color.use = NULL, group = NULL, group.levels = NULL, group.facet = NULL, group.facet.levels = NULL, n.row = 1, color.alpha = 1, legend.title = NULL, width=0.6, title.name = NULL, digits = 3,
                                xlabel = NULL, ylabel = NULL, remove.xtick = FALSE,
                                show.legend = TRUE, x.lab.rot = FALSE, angle.x = 45, vjust.x = NULL, hjust.x = 1, size.text = 10) {
  measure <- match.arg(measure)
  if (measure == "count") {
    df <- as.data.frame(sapply(object@net, function(x) sum(x$count)))
    if (is.null(ylabel)) {
      ylabel = "Number of inferred interactions"
    }
  } else if (measure == "weight") {
    df <- as.data.frame(sapply(object@net, function(x) sum(x$weight)))
    df[,1] <- round(df[,1],digits)
    if (is.null(ylabel)) {
      ylabel = "Interaction strength"
    }
  }
  colnames(df) <- "count"
  
  df$dataset <- names(object@net)
  if (is.null(group)) {
    group <- 1
  }
  df$group <- group
  df$dataset <- factor(df$dataset, levels = names(object@net))
  if (is.null(group.levels)) {
    df$group <- factor(df$group)
  } else {
    df$group <- factor(df$group, levels = group.levels)
  }
  
  if (is.null(color.use)) {
    color.use <- ggPalette(length(unique(group)))
  }
  #   theme_classic() #+ scale_x_discrete(limits = (levels(df$x)))
  if (!is.null(group.facet)) {
    if (all(group.facet %in% colnames(df))) {
      gg <- ggplot(df, aes(x=dataset, y=count, fill = group)) +
        geom_bar(stat="identity", width=width, position=position_dodge())
      gg <- gg + facet_wrap(group.facet, nrow = n.row)
    } else {
      df$group.facet <- group.facet
      if (is.null(group.facet.levels)) {
        df$group.facet <- factor(df$group.facet)
      } else {
        df$group.facet <- factor(df$group.facet, levels = group.facet.levels)
      }
      gg <- ggplot(df, aes(x=dataset, y=count, fill = group)) +
        geom_bar(stat="identity", width=width, position=position_dodge())
      gg <- gg + facet_wrap(~group.facet, nrow = n.row)
    }
  } else {
    gg <- ggplot(df, aes(x=dataset, y=count, fill = group)) +
      geom_bar(stat="identity", width=width, position=position_dodge())
  }
  gg <- gg + geom_text(aes(label=count), vjust=-0.3, size=size.text, position = position_dodge(0.9)) #changed size = 3
  gg <- gg + ylab(ylabel) + xlab(xlabel) + theme_classic() +
    labs(title = title.name) +  theme(plot.title = element_text(size = 10, face = "bold", hjust = 0.5)) +
    theme(text = element_text(size = size.text), axis.text = element_text(colour="black"))
  gg <- gg + scale_fill_manual(values = alpha(color.use, alpha = color.alpha), drop = FALSE)
  #  gg <- gg + scale_color_manual(values = alpha(color.use, alpha = 1), drop = FALSE) + guides(colour = FALSE)
  if (remove.xtick) {
    gg <- gg + theme(axis.text.x=element_blank(), axis.ticks.x=element_blank())
  }
  if (is.null(legend.title)) {
    gg <- gg + theme(legend.title = element_blank())
  } else {
    gg <- gg + guides(fill=guide_legend(legend.title))
  }
  if (!show.legend) {
    gg <- gg + theme(legend.position = "none")
  }
  if (x.lab.rot) {
    gg <- gg + theme(axis.text.x = element_text(angle = angle.x, hjust = hjust.x, vjust = vjust.x, size=size.text))
  }
  gg
  return(gg)
}






netVisual_aggregate_D <- function(object, signaling, signaling.name = NULL, color.use = NULL, thresh = 0.05, vertex.receiver = NULL, sources.use = NULL, targets.use = NULL, idents.use = NULL, top = 1, remove.isolate = FALSE,
                                  vertex.weight = 1, vertex.weight.max = NULL, vertex.size.max = NULL,
                                  weight.scale = TRUE, edge.weight.max = NULL, edge.width.max=8,
                                  layout = c("circle","hierarchy","chord","spatial"),
                                  pt.title = 12, title.space = 6, vertex.label.cex = 0.8,
                                  alpha.image = 0.15, point.size = 1.5,
                                  group = NULL,cell.order = NULL,small.gap = 1, big.gap = 10, scale = FALSE, reduce = -1, show.legend = FALSE, legend.pos.x = 20,legend.pos.y = 20,
                                  ...) {
  layout <- match.arg(layout)
  if (is.null(vertex.weight)) {
    vertex.weight <- as.numeric(table(object@idents))
  }
  if (is.null(vertex.size.max)) {
    if (length(unique(vertex.weight)) == 1) {
      vertex.size.max <- 5
    } else {
      vertex.size.max <- 15
    }
  }
  pairLR <- searchPair(signaling = signaling, pairLR.use = object@LR$LRsig, key = "pathway_name", matching.exact = T, pair.only = T)
  
  if (is.null(signaling.name)) {
    signaling.name <- signaling
  }
  net <- object@net
  
  pairLR.use.name <- dimnames(net$prob)[[3]]
  pairLR.name <- intersect(rownames(pairLR), pairLR.use.name)
  pairLR <- pairLR[pairLR.name, ]
  prob <- net$prob
  pval <- net$pval
  
  prob[pval > thresh] <- 0
  if (length(pairLR.name) > 1) {
    pairLR.name.use <- pairLR.name[apply(prob[,,pairLR.name], 3, sum) != 0]
  } else {
    pairLR.name.use <- pairLR.name[sum(prob[,,pairLR.name]) != 0]
  }
  
  
  if (length(pairLR.name.use) == 0) {
    stop(paste0('There is no significant communication of ', signaling.name))
  } else {
    pairLR <- pairLR[pairLR.name.use,]
  }
  nRow <- length(pairLR.name.use)
  
  prob <- prob[,,pairLR.name.use]
  pval <- pval[,,pairLR.name.use]
  
  if (length(dim(prob)) == 2) {
    prob <- replicate(1, prob, simplify="array")
    pval <- replicate(1, pval, simplify="array")
  }
  # prob <-(prob-min(prob))/(max(prob)-min(prob))
  
  if (layout == "hierarchy") {
    prob.sum <- apply(prob, c(1,2), sum)
    # prob.sum <-(prob.sum-min(prob.sum))/(max(prob.sum)-min(prob.sum))
    if (is.null(edge.weight.max)) {
      edge.weight.max = max(prob.sum)
    }
    par(mfrow=c(1,2), ps = pt.title)
    netVisual_hierarchy1(prob.sum, vertex.receiver = vertex.receiver, sources.use = sources.use, targets.use = targets.use, remove.isolate = remove.isolate, top = top, color.use = color.use, vertex.weight = vertex.weight, vertex.weight.max = vertex.weight.max, vertex.size.max = vertex.size.max, weight.scale = weight.scale, edge.weight.max = edge.weight.max, edge.width.max=edge.width.max, title.name = NULL, vertex.label.cex = vertex.label.cex,...)
    netVisual_hierarchy2(prob.sum, vertex.receiver = setdiff(1:nrow(prob.sum),vertex.receiver), sources.use = sources.use, targets.use = targets.use, remove.isolate = remove.isolate, top = top, color.use = color.use, vertex.weight = vertex.weight, vertex.weight.max = vertex.weight.max, vertex.size.max = vertex.size.max, weight.scale = weight.scale, edge.weight.max = edge.weight.max, edge.width.max=edge.width.max, title.name = NULL, vertex.label.cex = vertex.label.cex,...)
    graphics::mtext(paste0(signaling.name, " signaling pathway network"), side = 3, outer = TRUE, cex = 1, line = -title.space)
    # https://www.andrewheiss.com/blog/2016/12/08/save-base-graphics-as-pseudo-objects-in-r/
    # grid.echo()
    # gg <-  grid.grab()
    gg <- recordPlot()
  } else if (layout == "circle") {
    prob.sum <- apply(prob, c(1,2), sum)
    # prob.sum <-(prob.sum-min(prob.sum))/(max(prob.sum)-min(prob.sum))
    gg <- netVisual_circle(prob.sum, sources.use = sources.use, targets.use = targets.use, idents.use = idents.use, remove.isolate = remove.isolate, top = top, color.use = color.use, vertex.weight = vertex.weight, vertex.weight.max = vertex.weight.max, vertex.size.max = vertex.size.max, weight.scale = weight.scale, edge.weight.max = edge.weight.max, edge.width.max=edge.width.max,title.name = paste0(signaling.name), vertex.label.cex = vertex.label.cex,...)
  }  else if (layout == "spatial") {
    prob.sum <- apply(prob, c(1,2), sum)
    if (vertex.weight == "incoming"){
      if (length(slot(object, "netP")$centr) == 0) {
        stop("Please run `netAnalysis_computeCentrality` to compute the network centrality scores! ")
      }
      vertex.weight = object@netP$centr[[signaling]]$indeg
    }
    if (vertex.weight == "outgoing"){
      if (length(slot(object, "netP")$centr) == 0) {
        stop("Please run `netAnalysis_computeCentrality` to compute the network centrality scores! ")
      }
      vertex.weight = object@netP$centr[[signaling]]$outdeg
    }
    coordinates <- object@images$coordinates
    labels <- object@idents
    gg <- netVisual_spatial(prob.sum, coordinates = coordinates, labels = labels, alpha.image = alpha.image, point.size = point.size, sources.use = sources.use, targets.use = targets.use, idents.use = idents.use, remove.isolate = remove.isolate, top = top, color.use = color.use, vertex.weight = vertex.weight, vertex.weight.max = vertex.weight.max, vertex.size.max = vertex.size.max, weight.scale = weight.scale, edge.weight.max = edge.weight.max, edge.width.max=edge.width.max,title.name = paste0(signaling.name, " signaling pathway network"), vertex.label.cex = vertex.label.cex,...)
    
  } else if (layout == "chord") {
    prob.sum <- apply(prob, c(1,2), sum)
    gg <- netVisual_chord_cell_internal(prob.sum, color.use = color.use, sources.use = sources.use, targets.use = targets.use, remove.isolate = remove.isolate,
                                        group = group, cell.order = cell.order,
                                        lab.cex = vertex.label.cex,small.gap = small.gap, big.gap = big.gap,
                                        scale = scale, reduce = reduce,
                                        title.name = paste0(signaling.name, " signaling pathway network"), show.legend = show.legend, legend.pos.x = legend.pos.x, legend.pos.y= legend.pos.y)
  }
  
  return(gg)
  
}

