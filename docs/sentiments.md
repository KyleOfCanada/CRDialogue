
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
| Robbie   |   280 |     113 |  2.48 |
| Ashley   |  3387 |    1543 |  2.20 |
| Laura    | 14934 |    7361 |  2.03 |
| Sam      | 12517 |    6969 |  1.80 |
| Marisha  | 11006 |    6749 |  1.63 |
| Travis   | 10285 |    6477 |  1.59 |
| Liam     |  9524 |    6019 |  1.58 |
| Taliesin | 10636 |    7295 |  1.46 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
| :------- | -------: | -------: | ----: |
| Laura    |    18973 |    32329 |  1.70 |
| Robbie   |      372 |      615 |  1.65 |
| Ashley   |     4102 |     6666 |  1.63 |
| Sam      |    16185 |    24943 |  1.54 |
| Taliesin |    15666 |    23398 |  1.49 |
| Liam     |    15561 |    21099 |  1.36 |
| Marisha  |    19169 |    25024 |  1.31 |
| Travis   |    17733 |    22970 |  1.30 |

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
