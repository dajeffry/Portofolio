jumlah <- function(a , b){
  
  a + b
}

jumlah(2,3)

# Compare Classification Algorithm

performance <- function(table, n = 2){
  TN = table[1,1]
  TP = table[2,2]
  FN = table[2,1]
  FP = table[1,2]
  
  accuracy = (TP+TN) / (TP+TN+FP+FN)
  precision = TP / (FP+TP)
  Recall = TP / (FN+TP)
  f1 = 2 * precision * Recall / (precision + Recall)
  
  result <- paste("Accuracy = ", round(accuracy, n), 
                  "Precision = ", round(precision, n),
                  "Recall = ", round(Recall, n),
                  "F1 Score = ", round(f1, n))
  
  result
  
}

performance(logit.perf)
performance(ctree.perf)
performance(forest.perf)
performance(svm.perf)
