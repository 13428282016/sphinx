<?php

/**
 * Created by PhpStorm.
 * User: wmj
 * Date: 2016/10/14
 * Time: 10:49
 */
class FileNotFoundException extends Exception {
	public function __construct($message = "", $code = 0, Exception $previous = null) {
		parent::__construct($message, $code, $previous);
	}
}

$keywordFilename = $argv[2];
$dictFilename = $argv[1];
tokenize($keywordFilename, $dictFilename);
function tokenize($keywordFilename, $dictFilename) {


	$keyword = readKeyword($keywordFilename);
	echo "keyword:$keyword";
	$dict = readDict($dictFilename);
	echo "dict:\n";
	print_r($dict);
	$result=[];
	while($keyword){
		$resultSet=[];
		selectWord($keyword, $dict, $resultSet);
		echo "resultSet:\n";
		print_r($resultSet);
		$optimalWordSet=selectOptimalWordSet($resultSet);
		$word=$optimalWordSet[0];

		$result[]=$word;
		$keyword=mb_substr($keyword,mb_strlen($word,"UTF8"));
	
	}
	print_r($result);




}


function selectOptimalWordSet($resultSet) {


	$largestTotalLenResultSet = getWordSetWithLargestTotalLen($resultSet);
	if (count($largestTotalLenResultSet) === 1) {
		return $largestTotalLenResultSet[0];
	}

	$largestAvgLenResultSet = getLargestAvgWordLen($largestTotalLenResultSet);
	if (count($largestAvgLenResultSet) === 1) {
		return $largestAvgLenResultSet[0];
	}
	$largestVarianceResultSet = getLargestVariance($largestAvgLenResultSet);
	if (count($largestVarianceResultSet) === 1) {
		return $largestVarianceResultSet[0];
	}

	return $largestVarianceResultSet[0];

}

function readKeyword($filename) {
	if (!file_exists($filename)) {
		throw new FileNotFoundException("file not found {$filename}");
	}
	return file_get_contents($filename);
}

function readDict($filename) {
	if (!file_exists($filename)) {
		throw new FileNotFoundException("file not found {$filename}");
	}
	$content = file_get_contents($filename);
	$items = preg_split('/x:\d+/', $content);
	print_r($items);
	$words = [];
	foreach ($items as $item) {
		$subItem = explode("\t", trim($item));
		$words[] = $subItem[0];

	}
	$len = count($words);
	if (empty(end($words))) {
		unset($words[$len - 1]);
	}
	return $words;


}

function inDict($word, $dict) {

	return in_array($word, $dict);
}

function selectWord($keyword, $dict, &$resultSet, $preSelectedWords = [], $curWordNum = 1, $maxWordNum = 3) {

	$keywordLen = mb_strlen($keyword, 'UTF8');

	for ($i = 0; $i < $keywordLen; $i++) {

		$wordLen = $i + 1;
		$word = mb_substr($keyword, 0, $wordLen);
		if ($wordLen == 1) {
			$preSelectedWordsCopy = $preSelectedWords;
			$preSelectedWordsCopy[] = $word;
		} elseif (inDict($word, $dict)) {
			$preSelectedWordsCopy = $preSelectedWords;
			$preSelectedWordsCopy[] = $word;
		} else {
			continue;
		}

		if ($curWordNum < $maxWordNum && $wordLen != $keywordLen) {
			selectWord(mb_substr($keyword, $wordLen), $dict, $resultSet, $preSelectedWordsCopy, $curWordNum + 1, $maxWordNum);
		} else {
			$resultSet[] = $preSelectedWordsCopy;
		}

	}

}


function getWordSetWithLargestTotalLen($resultSet) {

	$maxLen = -1;
	$maxVarianceWordSetIndexs = [];
	foreach ($resultSet as $key => $wordSet) {
		$len = getWordTotalLen($wordSet);
		if ($len > $maxLen) {
			$maxLen = $len;
			$maxVarianceWordSetIndexs = [];
			$maxVarianceWordSetIndexs[] = $key;
		} elseif ($len == $maxLen) {
			$maxVarianceWordSetIndexs[] = $key;
		}
	}

	$largestWordSet = [];
	foreach ($maxVarianceWordSetIndexs as $index) {
		$largestWordSet[] = $resultSet[$index];
	}
	return $largestWordSet;

}

function getWordTotalLen($wordSet) {
	$totalLen = 0;
	foreach ($wordSet as $word) {
		$totalLen += mb_strlen($word,'UTF8');
	}
	return $totalLen;
}

function getLargestVariance($resultSet) {
	$avg=getAvgWordLen($resultSet[0]);
	$maxVariance = -1;
	$maxVarianceWordSetIndexs = [];
	foreach ($resultSet as $key => $wordSet) {
		$variance = getVariance($wordSet,$avg);
		if ($variance > $maxVariance) {
			$maxVariance = $variance;
			$maxVarianceWordSetIndexs = [];
			$maxVarianceWordSetIndexs[] = $key;
		} elseif ($variance == $maxVariance) {
			$maxVarianceWordSetIndexs[] = $key;
		}
	}

	$largestVarianceWordSetIndexs = [];
	foreach ($maxVarianceWordSetIndexs as $index) {
		$largestVarianceWordSetIndexs[] = $resultSet[$index];
	}
	return $largestVarianceWordSetIndexs;

}

function getLargestAvgWordLen($resultSet) {
	$totalLen=getWordTotalLen($resultSet[0]);
	$maxLen = -1;
	$maxVarianceWordSetIndexs = [];
	foreach ($resultSet as $key => $wordSet) {
		$len = getAvgWordLen($wordSet,$totalLen);
		if ($len > $maxLen) {
			$maxLen = $len;
			$maxVarianceWordSetIndexs = [];
			$maxVarianceWordSetIndexs[] = $key;
		} elseif ($len == $maxLen) {
			$maxVarianceWordSetIndexs[] = $key;
		}
	}

	$largestAvgLenWordSet = [];
	foreach ($maxVarianceWordSetIndexs as $index) {
		$largestAvgLenWordSet[] = $resultSet[$index];
	}
	return $largestAvgLenWordSet;

}

function getAvgWordLen($wordSet,$totalLen){
	return $totalLen / count($wordSet);
}

function getVariance($wordSet,$avg) {

	$totalVariance = 0;
	foreach ($wordSet as $word)
		$totalVariance += pow((count($word) - $avg), 2);

	return sqrt($totalVariance / count($wordSet));
}




function getFrequency($words) {

}

function mergeResult($resultSet) {

}

