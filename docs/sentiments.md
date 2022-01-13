
### Does Liam play the saddest bois? A word sentiment analysis of cast dialogue

Liam has a reputation for playing sad characters, but is this deserved?
Does his dialogue contain more sad words than the rest of the cast?

To answer this I searched the dialogue from the show for words
associated with a sad sentiment, and words associated with joy as a
control. I then calculated the ratio of joyful to sad words for each
cast member and plotted it.

![joyful vs sad](../plots/joySadPlot.png)

| Name     |   Joy | Sadness | Ratio |
| :------- | ----: | ------: | ----: |
| Ashley   |  3484 |    1574 |  2.21 |
| Robbie   |   372 |     173 |  2.15 |
| Laura    | 15055 |    7418 |  2.03 |
| Sam      | 12614 |    7003 |  1.80 |
| Marisha  | 11102 |    6786 |  1.64 |
| Travis   | 10538 |    6542 |  1.61 |
| Liam     |  9586 |    6038 |  1.59 |
| Taliesin | 10731 |    7344 |  1.46 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
| :------- | -------: | -------: | ----: |
| Laura    |    19104 |    32572 |  1.70 |
| Ashley   |     4165 |     6852 |  1.65 |
| Robbie   |      513 |      812 |  1.58 |
| Sam      |    16295 |    25146 |  1.54 |
| Taliesin |    15838 |    23608 |  1.49 |
| Liam     |    15631 |    21205 |  1.36 |
| Marisha  |    19282 |    25199 |  1.31 |
| Travis   |    17975 |    23335 |  1.30 |

Again Liam is near the bottom, but Travis still has a lower score.

-----

### References for lexicons

Hu, M., & Liu, B. (2004). Mining and summarizing customer reviews.
Proceedings of the 2004 ACM SIGKDD International Conference on Knowledge
Discovery and Data Mining - KDD ’04, 168.
<https://doi.org/10.1145/1014052.1014073>

Mohammad, S. M., & Turney, P. D. (2013). Crowdsourcing a Word–Emotion
Association Lexicon. Computational Intelligence, 29(3), 436–465.
<https://doi.org/10.1111/j.1467-8640.2012.00460.x>

Nielsen, F. Å. (2011). A new ANEW: Evaluation of a word list for
sentiment analysis in microblogs. ArXiv:1103.2903 \[Cs\].
<http://arxiv.org/abs/1103.2903>
