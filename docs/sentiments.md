
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
| Ashley   |  3650 |    1634 |  2.23 |
| Robbie   |   496 |     231 |  2.15 |
| Laura    | 15267 |    7497 |  2.04 |
| Sam      | 12783 |    7070 |  1.81 |
| Marisha  | 11291 |    6874 |  1.64 |
| Travis   | 10800 |    6638 |  1.63 |
| Liam     |  9712 |    6107 |  1.59 |
| Taliesin | 10907 |    7430 |  1.47 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
| :------- | -------: | -------: | ----: |
| Laura    |    19300 |    33041 |  1.71 |
| Robbie   |      648 |     1084 |  1.67 |
| Ashley   |     4289 |     7106 |  1.66 |
| Sam      |    16435 |    25481 |  1.55 |
| Taliesin |    16115 |    23966 |  1.49 |
| Liam     |    15796 |    21456 |  1.36 |
| Marisha  |    19487 |    25558 |  1.31 |
| Travis   |    18287 |    23690 |  1.30 |

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
